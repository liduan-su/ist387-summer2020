################################################

# IST387, Standard Homework Heading
#
# Student name: Liwen Duan 
# Homework number: 8
# Date due: 2020/7/11
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

# Run these three functions to get a clean test of homework code
dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

# Set working directory 
#setwd("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/*/") # Change to the folder containing your homework data files

# Your homework specific code goes below here

#################################################

#A
library('psych')
?psych
summary(sat.act)

#B
plot(sat.act$gender, sat.act$ACT)


plot(sat.act$age, sat.act$ACT)


plot(sat.act$education, sat.act$ACT)

#C
actM <- lm (formula = ACT ~ gender+age+education, data = sat.act)

#D
summary(actM)
#Adjusted R-squared:  0.02301 
#education is statistically significant has coefficients of 0.47890
#it also has ** notation indicate it's significant.

#E
#Overall this model is not a really good model since it has adjusted r-squared of 0.02... make it really unreliable model to use.
#gender has estimate of -0.48, it is in negative range makes it the lowest value among all predictors.
#age has estimate of 0.01 and not really high number.
#education, has the highest estimate of 0.47890, a higher t-value of 3.143 make it significant

#F
satVM <- lm (formula = SATV ~ gender+age+education, data = sat.act)
summary(satVM)
satQM <- lm (formula = SATQ ~ gender+age+education, data = sat.act)
summary(satQM)

#G
predDF <- data.frame(gender=1, education=1, age=18)
predict(actM, predDF)
#27.70198
