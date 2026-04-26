Aim of project was to build a classifier that can detect credit card fraudulent transaction by use of a variety of machine learning
algorithms that will be able to discern fraudulent from non-fraudulent transactions.In this report, we compare the performance of two
classification models: Logistic Regression and Decision Tree. Both models are evaluated on their AUC(Area Under the ROC Curve), which 
quantifies the ability of the model to distinguish between the positive and negative classes.Given the imbalanced nature of the
dataset, with class 0 being more prevalent than class 1, AUC is a more reliable metric in evaluating the model.A higher AUC indicates better performance,
with a value closer to 1.0 representing ideal performance and a value near 0.5 suggesting random guessing.

The AUC performance for Logistic Regression was 0.966 whilst that of the Decision Tree Model was 0.8525.Both models performed well at distinguishing classes
but Logistic Regression model's higher AUC suggests it handles the imbalance better. The decision tree model with a lower AUC may struggle more with the imbalance.
