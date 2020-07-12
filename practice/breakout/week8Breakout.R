# Run these three functions to get a clean test of homework code
dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment


library(MASS)
library(ggplot2)

ggplot(data=Boston) + aes(x=rm, y=medv) + geom_point() + geom_smooth(method="lm", se=FALSE)

#1
ggplot(data=Boston) + aes(x=crim, y=medv) + geom_point() + geom_smooth(method="lm", se=FALSE)

#2
hist(Boston$crim)
summary(Boston$crim)
# from the histogram we can see there are really high per capita crime rate by town between 0 and 20.

#3
lmOut <- lm(formula = medv ~ crim, data = Boston)
summary(lmOut)

#4
lmOut <- lm(formula = medv~crim + rm + dis, data = Boston)
summary(lmOut)

#5
# the R-squared show this model has 53% of possibility
# the f test result show a really high value with a low p-value, show a really little possibility.
# rm - average number of rooms per dwelling are show really high estimate value about 8.3
# crim - -0.25405
# dis -  0.12627  

#6
predDF <- data.frame(crim = 0.2 , rm = 2, dis = 5)

#7
predict(lmOut, predDF)

