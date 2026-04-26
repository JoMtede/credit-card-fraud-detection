Aim of project was to build a classifier that can detect credit card fraudulent transaction by use of a variety of machine learning
algorithms that will be able to discern fraudulent from non-fraudulent transactions.In this report, we compare the performance of two
classification models: Logistic Regression and Decision Tree. Both models are evaluated on their AUC(Area Under the ROC Curve), which 
quantifies the ability of the model to distinguish between the positive and negative classes.Given the imbalanced nature of the
dataset, with class 0 being more prevalent than class 1, AUC is a more reliable metric in evaluating the model.A higher AUC indicates better performance,
with a value closer to 1.0 representing ideal performance and a value near 0.5 suggesting random guessing.

The AUC performance for Logistic Regression was 0.966 whilst that of the Decision Tree Model was 0.8525.Both models performed well at distinguishing classes
but Logistic Regression model's higher AUC suggests it handles the imbalance better. The decision tree model with a lower AUC may struggle more with the imbalance.

There are however other metrics that were put into consideration. Below are the Confusion Matrix results for the two models, Logistic Regression followed by the Decision Tree.

Confusion Matrix and Statistics- Logistic Regression

          Reference
Prediction     0     1
         0 56643    39
         1     8    56
                                          
               Accuracy : 0.9992          
                 95% CI : (0.9989, 0.9994)
    No Information Rate : 0.9983          
    P-Value [Acc > NIR] : 3.645e-08       
                                          
                  Kappa : 0.704           
                                          
 Mcnemar's Test P-Value : 1.209e-05       
                                          
            Sensitivity : 0.9999          
            Specificity : 0.5895          
         Pos Pred Value : 0.9993          
         Neg Pred Value : 0.8750          
             Prevalence : 0.9983          
         Detection Rate : 0.9982          
   Detection Prevalence : 0.9989          
      Balanced Accuracy : 0.7947          
                                          
       'Positive' Class : 0 
       
       Confusion Matrix and Statistics- Decision Tree

          Reference
Prediction     0     1
         0 56643    32
         1     8    63
                                         
               Accuracy : 0.9993         
                 95% CI : (0.999, 0.9995)
    No Information Rate : 0.9983         
    P-Value [Acc > NIR] : 1.444e-10      
                                         
                  Kappa : 0.7587         
                                         
 Mcnemar's Test P-Value : 0.0002762      
                                         
            Sensitivity : 0.9999         
            Specificity : 0.6632         
         Pos Pred Value : 0.9994         
         Neg Pred Value : 0.8873         
             Prevalence : 0.9983         
         Detection Rate : 0.9982         
   Detection Prevalence : 0.9987         
      Balanced Accuracy : 0.8315         
                                         
       'Positive' Class : 0 
Both models perform extremly well, with accuracy in the range of 99.92% to 99.93%. However, the Decision Tree shows a slight edge in terms of Kappa, specifity, NPV and Balanced Accuracy.The results show that while Logistic Regression is strong performer, it struggles a bit more with detecting the minority class(class 1) and achieving high specifity. The Decision Tree however handles the class imbalance slightly better and provides a more balanced performance overall.
