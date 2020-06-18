################################################

# IST387, Standard Homework Heading

#

# Student name: Liwen Duan

# Homework number: 4

# Date due: 2020/5/13

#

# Attribution statement: (choose only one)

# 1. I did this homework by myself, with help from the book and the professor

# Run these three functions to get a clean test of homework code

#dev.off() # Clear the graph window

cat('\014')  # Clear the console

rm(list=ls()) # Clear user objects from the environment

# Set working directory 

#setwd("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/4/") # Change to the folder containing your homework data files

# Your homework specific code goes below here

vectorStats <- function(numVector)
{
    listOfStats <- c(
        mean(numVector),
        median(numVector)
    )
    return(listOfStats)
}

# A. Test your function by calling it with the numbers one through ten:
vectorStats(1:10)

# B. Enhance the vectorStats() function to add the following information to the output:
vectorStats <- function(numVector)
{
listOfStats <- c(
    min(numVector),
    mean(numVector),
    median(numVector),
    max(numVector),
    sd(numVector)
)
return(listOfStats)
}

# C. Retest your enhanced function by calling it with the numbers one through ten:
vectorStats(1:10)

# D. Copy the airquality data frame: myAQdata <- airquality
# Use 
myAQdata <- airquality
View(myAQdata)
# to show the data. Add a block comment that describes what
# you think each variable in the data set contains. 
# Hint: Use the ? or help( ) command to get help on this data set.
# Answer: this data set is showing about the air quality in New York. It contain information on ozone, Solar, Wind, Temperature, Month and day. 

# E. Sample five observations from myAQdata$Wind, like this:
sample(myAQdata$Wind, size=5)

# F. Call your 
vectorStats(sample(myAQdata$Wind, size=5))
# function with a sample of five observations from
# myAQdata$Wind.

# G. Use the replicate( ) function to repeat your code from problem F ten times. The first argument to replicate( ) is the number of repeats you want. The second argument is the little chunk of code you want repeated.
replicate(10, vectorStats(sample(myAQdata$Wind, size=5)))

# H. Write a comment describing why every replication produces a different result.
# because each time sample from dataset, the function will pick different element from it. Reflect on the replication, it will provide different result.

# Challenge: Raise your sample size from 5 up to 50. How does that affect your replications?
replicate(10, vectorStats(sample(myAQdata$Wind, size=50)))
# We will because we have a larger data set, we would able to get a result close to realistic. Also The data is tend to be consistent, especially we can SD and mean returned when we have larger sample.