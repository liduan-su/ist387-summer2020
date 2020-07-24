# Run these three functions to get a clean test of homework code
#dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

#install.packages('kernlab')
library(kernlab)

data("spam")
str(spam)
dim(spam) 
table(spam$type)

randIndex <- sample(1:dim(spam)[1])
summary(randIndex)
head(randIndex)
cutPoint2_3 <- floor(2 * dim(spam)[1]/3)
cutPoint2_3
trainData <- spam[randIndex[1:cutPoint2_3],]
testData <- spam[randIndex[(cutPoint2_3):dim(spam)[1]],]

svmOutput <- ksvm(type ~., data=trainData, kernel ="rbfdot", kpar='automatic', C = 50, cross = 3, prob.model=TRUE)
svmOutput

svmPred <- predict(svmOutput, testData, type="votes")
compTable <- data.frame(testData[,58], svmPred[1,])
table(compTable)
