##1. importing dataset
install.packages("corrplot")
install.packages("tidyverse")
install.packages("pROC")
install.packages("carTools")

library(caret)
library(ggplot2)

data <- read.csv("creditcard.csv")
str(data)
summary(data)

# Convert Class column into Factors
data$Class <- as.factor(data$Class)
levels(data$Class) <- c("Legit", "Fraud")
data$Class <- ifelse(data$Class == "Legit", 0, 1)
# function to set plot height and width
fig <- function(width, height)
{options(repr.plot.width = width, repr.plot.height = height)}

##2. data exploration
# summary of amount
summary(data$Amount)
sd(data$Amount)
var(data$Amount)
IQR(data$Amount)

## distribution of class

ggplot(data, aes(x = factor(Class), fill = factor(Class))) + 
  geom_bar(color = "black") + 
  ggtitle("Bar Distribution of Class") + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))
        
counts <- table(data$Class)

result <- data.frame(
  Class = names(counts),
  Count = as.vector(counts),
  Proportion = round(prop.table(counts), 5))

print(result)
## distribution of amount

ggplot(data, aes(x = Amount)) +
  geom_histogram(fill = "blue", color = "black", bins = 30) +
  ggtitle("Histogram Distribution of Amount") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Function to find range of outliers in Amount

find_outlier_range <- function(x){
  outliers <- boxplot.stats(x)$out
  return(range(outliers))
  }

find_outlier_range(data$Amount)
## 3data wrangling
# Check for missing values

colSums(is.na(data))
sum(is.na(data))
# Check for duplicate rows and remove them
library(dplyr)
sum(duplicated(data))
data <- distinct(data)
#remove time from the data
data$Time <- NULL
# Standardise Amount feature
data$Amount <- scale(data$Amount)
summary(data$Amount)

library(corrplot)

data2 <- data

data2$Class <- as.numeric(data2$Class)

corr <- cor(data2[], method = "pearson")

options(repr.plot.width = 16, repr.plot.height = 12)

corrplot(corr)

##4 data modelling
library(caTools)
set.seed(123)

# Split the data into training and test sets
sample <- sample.split(data2$Class, SplitRatio = 0.80)

trainData <- subset(data2, sample == TRUE)
testData <- subset(data2, sample == FALSE)

dim(trainData)  
dim(testData)   

#4.1logistic regression

model <- glm(Class ~ ., data = testData, family = "binomial")
summary(model)
plot(model)

model <- glm(Class ~ ., data = trainData, family = "binomial")
summary(model)
plot(model)

# Generate the ROC curve

library(pROC)
model_prediction <- predict(model, newdata = testData, type = 'response') 

roc_curve <- roc(testData$Class, model_prediction)
plot(roc_curve, 
     main = "ROC Curve", 
     col = "blue", 
     print.auc = TRUE, 
     print.auc.x = 0.6, 
     print.auc.y = 0.4)

# Generate confusion matrix for Logistic Regression
model_predictionClass <- ifelse(model_prediction > 0.5, 1, 0)
logistic_confusion_matrix <- confusionMatrix(as.factor(model_predictionClass), as.factor(testData$Class))
print(logistic_confusion_matrix)

#4.2 decision tree model
install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
set.seed(123)
# Fit the decision tree model
tree_model <- rpart(Class ~ ., data = trainData, method = "class")

print(tree_model)

rpart.plot(tree_model)

# Predict on the test set
predictions <- predict(tree_model, newdata = testData, type = "class")
probabilities <- predict(tree_model, newdata = testData, type = "prob")

# Calculate accuracy based on predicted class labels
accuracy <- sum(predictions == testData$Class) / nrow(testData)
print(paste("Accuracy: ", accuracy))

# Generate confusion matrix for Decision Tree
library(caret)
tree_confusion_matrix <- confusionMatrix(predictions, as.factor(testData$Class))
print(tree_confusion_matrix)

# Library for ROC curve
library(pROC)
positive_class_prob <- probabilities[, 2]
true_class_numeric <- as.numeric(testData$Class) - 1 

roc_curve <- roc(true_class_numeric, positive_class_prob)
plot(roc_curve, main = "ROC Curve for Decision Tree Model")
print(paste("AUC: ", auc(roc_curve)))

