##########
# Run these three functions to get a clean test of homework code
dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

# Liwen Duan

##########

library(caret)
library(kernlab)

data("GermanCredit")
subCredit <- GermanCredit[,1:10]
str(subCredit)

#Pt. 1
#1
# The subCredit is data we copied from GermanCredit. It contain all the row and the first 10 column.
# It create a dataframe of 1000 line
# with information of Duration, amount, installmetn rate, residence, age, credits, whether it have telephone and whether it is a foreign worker and whether it is in good or bad credit class.


#2
trainList <-
  createDataPartition(y=subCredit$Class,p=.50,list=FALSE)

#3
dim(trainList)

#4
trainSet <- subCredit[trainList,]

#5
testSet <- subCredit[-trainList,]

#Pt. 2
#6
boxplot(Duration ~ Class, data=trainSet)
boxplot(Amount ~ Class, data=trainSet)
boxplot(InstallmentRatePercentage ~ Class, data=trainSet)
#Median, Q3 and maximum are overlapped for bad credit class

boxplot(ResidenceDuration ~ Class, data=trainSet)
#same

boxplot(Age ~ Class, data=trainSet)
#Slightly higher age for good credit class

#7
svmModel <- ksvm(Class ~ ., data=trainSet,
                 kernel= "rbfdot", kpar = "automatic",
                 C = 5, cross = 3, prob.model = TRUE)
#8
svmModel
# It is not a really good model, the Cross validation error is a little bit high at about 0.316

#9
predOut <- predict(svmModel, newdata=testSet, type="response")

#10
result <- table(predOut, testSet$Class)
result

#11
totalCorrect <- result[1,1] + result[2,2]
totalCorrect/sum(result)
# Overall accuracy for this model is 0.358

diag(result)
sum(result)
