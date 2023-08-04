
#TASK 2: Machine learning model:  Classification and Cross Validation Model

#Importing libraries
library(datasets)
library(caret)

# Importing the dhfr data set
data(dhfr)

# Check to see if there are missing data
sum(is.na(dhfr))
# no missing data

# To achieve reproducible model; set the random seed number to fixed number / 
#to get always same result when rerunning the model
set.seed(100)

# Performs stratified random split of the data set / to have a training set and then testing set
TrainingIndex <- createDataPartition(dhfr$Y, p=0.8, list = FALSE) #randomly selects 120 out of 150
TrainingSet <- dhfr[TrainingIndex,] # Training Set represents 80%
TestingSet <- dhfr[-TrainingIndex,] # Test Set is a 20%


# SVM model (polynomial kernel)

#Build Training Model
#We use the trainingSet to produce training Model
# We will use Training Model to predict class label in testing set
Model <- train(Y ~ ., data = TrainingSet,
               method = "svmPoly",
               na.action = na.omit,                      #if there is missing value it will delete it
               preProcess=c("scale","center"),           # scale the data around mean
               trControl= trainControl(method="none"),
               tuneGrid = data.frame(degree=1,scale=1,C=1)
)

# Build Cross Validation model
# We are using Training Model and divide it into 10 subGroups
Model.cv <- train(Y ~ ., data = TrainingSet,
                  method = "svmPoly",
                  na.action = na.omit,
                  preProcess=c("scale","center"),
                  trControl= trainControl(method="cv", number=10),
                  tuneGrid = data.frame(degree=1,scale=1,C=1)
)

# Apply model for prediction
Model.training <-predict(Model, TrainingSet) # Apply model to make prediction on TrainingSet
Model.testing <-predict(Model, TestingSet) # Apply model to make prediction on Testing set
Model.cv <-predict(Model.cv, TrainingSet) # Perform cross-validation

#Look at the Prediction Performance
#Model performance (Displays confusion matrix and statistics)
Model.training.confusion <-confusionMatrix(Model.training, TrainingSet$Y)
Model.testing.confusion <-confusionMatrix(Model.testing, TestingSet$Y)
Model.cv.confusion <-confusionMatrix(Model.cv, TrainingSet$Y)

print(Model.training.confusion) #one of the inactive is miss predicted to be active 
print(Model.testing.confusion) #three of the inactive is miss predicted to be active 
print(Model.cv.confusion)  #one of the inactive is miss predicted to be active


# Feature importance
Importance <- varImp(Model)
plot(Importance, top=20)
plot(Importance, col = "blue")

#to see which of the variables are most important

