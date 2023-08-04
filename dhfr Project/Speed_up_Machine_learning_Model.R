#Task 4: Speeding up Machine Learning Model

install.packages('e1071')
install.packages('doParallel')

# Importing libraries
library(datasets) 
library(caret) # Package for machine learning algorithms / CARET stands for Classification And REgression Training

# Importing the dhfr data set
data(dhfr)

# Check to see if there are missing data
sum(is.na(dhfr))

# To achieve reproducible model; set the random seed number
set.seed(100)

# Performs stratified random split of the data set
TrainingInd <- createDataPartition(dhfr$Y, p=0.8, list = FALSE)
TrainSet <- dhfr[TrainingInd,] # Training Set
TestSet <- dhfr[-TrainingInd,] # Test Set


# Random forest for model speed up

# Run normally without parallel processing
start.time <- proc.time()  #we are timing it
Model <- train(Y ~ ., 
               data = TrainSet, # Build model using training set
               method = "rf" # Learning algorithm
)
stop.time <- proc.time() 
run.time <- stop.time - start.time #subtract them in order to get run time
print(run.time)

#time taken is 73.9 sec


# Use doParallel
library(doParallel)

cl <- makePSOCKcluster(5)
registerDoParallel(cl)

start.time <- proc.time()
Model <- train(Y ~ ., 
               data = TrainSet, # Build model using training set
               method = "rf" # Learning algorithm
)
stop.time <- proc.time()
run.time <- stop.time - start.time
print(run.time)

stopCluster(cl)

#time taken is 21.1 seconds
#This one is 3.5 times faster



# Run without parallel processing
#we are trying warring the mtry
start.time <- proc.time()
Model <- train(Y ~ ., 
               data = TrainSet, # Build model using training set
               method = "rf", # Learning algorithm
               tuneGrid = data.frame(mtry = seq(5,15, by=5))
)
stop.time <- proc.time()
run.time <- stop.time - start.time
print(run.time)

#time taken is 18.836 seconds

# Using doParallel

library(doParallel)

cl <- makePSOCKcluster(5)
registerDoParallel(cl)

start.time <- proc.time()
Model <- train(Y ~ ., 
               data = TrainSet, # Build model using training set
               method = "rf", # Learning algorithm
               tuneGrid = data.frame(mtry = seq(5,15, by=5))
)
stop.time <- proc.time()
run.time <- stop.time - start.time
print(run.time)

#time taken is 15.37 seconds
#model varrying the mtry with parallel processing is faster





