################################################

# IST387, Standard Homework Heading
#
# Student name: Liwen Duan 
# Homework number:10 
# Date due: 2020/7/25
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

# Run these three functions to get a clean test of homework code
dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

# Set working directory 
setwd("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/10/")# Change to the folder containing your homework data files

# Your homework specific code goes below here

#################################################

#Pt. 1
#A
library('ggplot2')
library('kernlab')

#B
mydiamonds<-diamonds[(diamonds$cut=="Premium" | diamonds$cut=="Ideal"),]

#C
mydiamonds$clarity <- as.numeric(mydiamonds$clarity)
mydiamonds$color <- as.numeric(mydiamonds$color)

#D
# Carat is the weight of the diamond, the large is better(rare)
# Cut the quality of the diamonds
# color to numeric, the lower is better (1-7)
# clarity to numeric, the higher is better (1-8)
# depth is calculate from variable x, y, z
# table is the width of top idamend relative to widest point
# price
# x, y, z are physical measurement of the diamonds.

#Pt. 2
#E
rowNumber <- nrow(mydiamonds)
cutpoint <- floor(rowNumber/3*2)
rand <- sample(1:rowNumber)
trainData <- mydiamonds[rand[1:cutpoint],]
testData <- mydiamonds[rand[(cutpoint+1):rowNumber],]

#F
dim(trainData)
dim(testData)

#Pt. 3
#G , I
svmOutput <- ksvm(cut~., data = trainData, kernel= "rbfdot", kpar = "automatic", C = 5, cross = 3, prob.model = TRUE)
svmOutput

#H
# kernal is the formular used to make predict model
# C value is 'cost of constraints'. This value will have impact for the predict model. 
# Higher C value will provide higher cross-validation error, or how well the model is. But lower training error. Made this model too fit with training model, maybe not fit for predict in general prediction. 
# Lower C value will provide lower cross-validation error. But higher in training error.
# we want to balance the C value to a balanced level.
# Cross is the cross-validation model that algorithm uses. 

#Pt. 4
#J
svmPred <- predict(svmOutput,newdata=testData,type = "response")


#K
str(svmPred)
head(svmPred)

#L
compTable <- data.frame(svmPred, testData$cut)
result <- table(compTable)
result

#M
(result[1,4] + result[2,5])/sum(result)
# 0.9210593

# Expert Mode
# We want our dataset that are not included in training dataset so we can know whether our predict model work. Because we know the result already, 
# we can see if our model works well, predict result should be the same with actural result. if it is not, we can work on algorithm to make it better.

# Ultra-Power Expert Mode
m1 <- lm(formula = as.numeric(cut)~., data = trainData)
summary(m1)
