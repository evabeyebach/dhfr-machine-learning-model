# DHFR Machine Learning Model
## Introduction
We are using the dhfr (Dihydrofolate Reductase Inhibitors Data) data set. In this data set Sutherland and Weaver (2004) discuss QSAR models for dihydrofolate reductase (DHFR) inhibition. It contains values for 325 compounds which describe drug molecules. For each compound, 228 molecular descriptors (that tell about physical/chemical properties of each drug molecule) have been calculated. Additionally, each samples is designated as "active" or "inactive". Active means that the drug molecule is efficient in exerting the desirable binding effects toward dhfr protein. Dhfr protein is important for having anti-malarial protein.

## Objectives
We want to create a data mining model to predict whether a compound will be a good or bad drug (active or inactive)
which.We are developin a classification and croos-valitadion model in order to predict active or inactive compunds.

## Analysis
Task 1: EDA and Data Visualitazion

Task 2: Build Machine Learning Model (classification and cross validation) > to predict if it is going to be active or inactive 
1. We are splitting the data into two parts. First into Training Set (80% od data) , to create Training Model. Then we are using the Training Model to predict the class label in the 20% of the Testing Set. 
2. Create Support Vector Machine Model (polynomial kernel) and Classification Model
3. Apply Model for Prediction and look at prediction performance
4. Print Performance Models
   
Task 3: Deploy Model as RDS File and make prediction

Task 4: Speed up Model Random Forest Model using parallel processing

## Conclusion
Both the Classification Model and the Cross Validation Model had a overall good prediction on "active" or "inactive" molecules.
When testing the classification Model, from 40 actives, 2 were predicted as inactive and from 24 inactives, 2 were predicted to be active. Accuracy was  0.9219 and Sensitivity : 0.9500, Specificity : 0.8750. The cross-validation Model predicted from 163 actives, 1 as inactive and from 98 inactives, 1 as active. Accuracy : 0.9923, Sensitivity : 0.9939 and     Specificity : 0.9898.
The Model varrying the mtry with parallel processing was the fastest.

