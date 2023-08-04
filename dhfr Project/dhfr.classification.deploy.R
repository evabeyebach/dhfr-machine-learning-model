#TASK 3: Deploy model as RDS file and read it in to make prediction

library(datasets)
library(caret)

# Importing the dhfr data set
data(dhfr)

# Check to see if there are missing data?
sum(is.na(dhfr))
# no missing data

#set random seed number
set.seed(100)

# Performs stratified random split of the data set / to have a training model and then set model
TrainingIndex <- createDataPartition(dhfr$Y, p=0.8, list = FALSE) #randomly selects 120 out of 150
TrainingSet <- dhfr[TrainingIndex,] # Training Set represents 80%
TestingSet <- dhfr[-TrainingIndex,] # Test Set is a 20%

# SVM model (polynomial kernel)

#Build Training Model

Model <- train(Y ~ ., data = TrainingSet,
               method = "svmPoly",
               na.action = na.omit,
               preProcess=c("scale","center"),
               trControl= trainControl(method="none"),
               tuneGrid = data.frame(degree=1,scale=1,C=1)
)

# Save model to RDS file

saveRDS(Model, "Model.rds")

# Read the model from RDS file

read.Model <- readRDS("Model.rds")

# Apply model for prediction on 20% of data set
Model.training <-predict(read.Model, TrainingSet) # Apply model to make prediction
Model.testing <-predict(read.Model, TestingSet) # Apply model to make prediction on Testing set

# Model performance (Displays confusion matrix and statistics)
Model.training.confusion <-confusionMatrix(Model.training, TrainingSet$Y)
Model.testing.confusion <-confusionMatrix(Model.testing, TestingSet$Y)

print(Model.training.confusion) #From the 98 inactive, 1 was predicted as active
print(Model.testing.confusion) #From 24 inactives, 4 were predicted as actives


#for example out of the 98 inactives, 2 are mispredictes as active

# Feature importance
Importance <- varImp(Model)
plot(Importance, top=20)
plot(Importance, col = "blue")
#to see which of the variables is most important

