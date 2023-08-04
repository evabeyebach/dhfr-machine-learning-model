# DHFR Classification Model
## Introduction
We are using the dhfr (Dihydrofolate Reductase Inhibitors Data) data set. In this data set Sutherland and Weaver (2004) discuss QSAR models for dihydrofolate reductase (DHFR) inhibition. It contains values for 325 compounds which describes drug molecules. For each compound, 228 molecular descriptors, whichtells about physical/chemical properties of each drug molecule, have been calculated. Additionally, each samples is designated as "active" or "inactive". Active means that the drug molecule is efficient in exerting the desirable binding effects toward dhfr protein. Dhfr protein is important for having anti-malarial protein.

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

