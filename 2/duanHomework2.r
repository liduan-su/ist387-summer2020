################################################

# IST387, Standard Homework Heading

#

# Student name: Liwen Duan 

# Homework number: 2

# Date due: 2020/05/30

#

# Attribution statement: (choose only one)

# 1. I did this homework by myself, with help from the book and the professor

# Run these three functions to get a clean test of homework code

#dev.off() # Clear the graph window

cat('\014')  # Clear the console

rm(list=ls()) # Clear user objects from the environment

 

# Set working directory 

#setwd("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/2/") # Change to the folder containing your homework data files

 

# Your homework specific code goes below here

myCars <- mtcars
summary(myCars)
View(myCars)

#Step1
# A. What is the mean mpg? Use mean() or summary()
mean(myCars$mpg)
#[1] 20.09062

# B. What is the value of the highest mpg? Use max() or summary()
max(myCars$mpg)
#[1] 33.9

# C. What is the value of the lowest mpg? Use min() or summary()
min(myCars$mpg)
#[1] 10.4

# D. Create a sorted dataframe based on mpg and store it in mtCarsSorted; Use order( ) 
mtCarsSorted <- myCars[order(myCars$mpg),]

#Step2
# E. Write a comment: Is higher or lower HP best?
#Higher HP are the best!

# F. Which car has the highest hp? Use which.max( )
myCars[which.max(myCars$hp),]
#Maserati Bora

# G. Which car has the lowest hp? Use which.min( )
myCars[which.min(myCars$hp),]
#Honda Civic


#Step3
# H. Run 
scaledMPG <- scale(myCars$mpg, center=0, scale=T)
# I. Write a comment that explains what that command accomplishes.
#scale command is scales the matrix. In this case, data in mpg are convert into a "ruler" between 0 and 1, for easily comparison. 

# J. Copy that command and modify it to create a new, scaled version of myCars$hp.
scaledHP <- scale(myCars$hp, center=0, scale=T)

# K. Combine the two scaled measurements by multiplying them. Explain in a comment how and why this works.
scaledMPG * scaledHP
#it provide a measurement in relation of two factor in a single number.

# L. Add the combined measurement to your dataset. Something like this should work:
myCars$combined <- scaledMPG * scaledHP

# M. Which car has the highest combination of mpg and hp? 
myCars[which.max(myCars$combined),]
#Maserati Bora