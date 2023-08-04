#TASK1: EDA and Data Visualization

#loading packages
install.packages("skimr")
library(datasets)
library(skimr)
library(dplyr)
library(tidyverse)
library(caret)

#import data
data(dhfr)
View(dhfr)


#head(), tail()
head(dhfr, 5)
tail(dhfr, 5)

#summary()
summary(dhfr)
summary(dhfr$Y)
skim(dhfr) #to display summary statistics

# Check to see if there are missing data
sum(is.na(dhfr))

#check for duplicates
duplicated(dhfr)

#Group data by Y (biological activity) then perform skim
#sum
dhfr %>%
  dplyr::group_by(Y) %>%
  skim()
#more summaryy, various quartiles and histogram dist.


#Quick Data Visualization

plot(dhfr$moe2D_zagreb, dhfr$moe2D_weinerPol)

plot(dhfr$moe2D_zagreb, dhfr$moe2D_weinerPol, col = "green")     # Makes green circles 

plot(dhfr$moe2D_zagreb, dhfr$moe2D_weinerPol, col = dhfr$Y)    # Color by Y

plot(dhfr$moe2D_zagreb, dhfr$moe2D_weinerPol, col = "green",     # Makes green circles + Adds x and y axis labels
     xlab = "moe2D_zagreb", ylab = "moe2D_weinerPol")

# Histogram
hist(dhfr$moe2D_zagreb)
hist(dhfr$moe2D_zagreb, col = "green")   # Makes red bars


#Feature Plots

featurePlot(x = dhfr[,2:5],
            y = dhfr$Y,
            plot = "box",
            strip=strip.custom(par.strip.text=list(cex=.7)),
            scales = list(x = list(relation="free"), 
                          y = list(relation="free")))
#we see feature importance plot for active vs inactive drug molecule for first columns
#to see if it is more acctive or inactive on each molecular descriptor
