################################################
# IST387, Standard Homework Heading
#
# Student name: Liwen Duan
# Homework number: 1
# Date due: 5/23/2020
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor
# 2. I did this homework with help from the book and the professor and these Internet sources:
# 3. I did this homework with help from <Name of another student> but did not cut and paste any code

# Run these three functions to get a clean test of homework code
#try(dev.off()) # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

# Set working directory 
#setwd("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/1") # Change to the folder containing your homework data files

height <- c(59, 60, 61, 58, 67, 72, 70, 64)
weight <- c(150, 140, 180, 220, 160, 140, 130, 155)

a <- 150

#---------------------------------------------------------------------------
# Step 1: Calculating statistics using R  

# A.	 Compute the average height and average weight with the mean() function
mean(height)
mean(weight)

# B.	 Show the number of observations in height with the length() function 
length(height)

# C.	 Show the number of observations in weight with the length() function
length(weight)

# D.	 Calculate the sum of the heights with the sum() function
sum(height)

# E.	 Calculate the sum of the weights with the sum() function
sum(weight)

# F.	 Compute the average height by combining results from B and D
sum(height) / length(height)

# G.	 Recompute the average weight by combining results from C and E
sum(weight) / length(weight)

#---------------------------------------------------------------------------
# Step 2: Using the max/min functions in R

# H. Compute the max height, store the result in ‘maxH’
maxH <- max(height)

# I. Compute the min weight, store the results in ‘minW’
minW <- min(weight)
#---------------------------------------------------------------------------
# Step 3: Vector Math

# J. Create a new vector called extraWeight, which is the weight + 25 (every person has a 25-pound backpack)
extraWeight <- weight + 25
# K. Compute the average of extraWeight
mean(extraWeight)

#---------------------------------------------------------------------------
# Step 4: Using Conditional if statements

# Hint - Try the following code in R:

if  (100 < 150) "100 is less than 150" else "100 is greater than 150"

# L. Test if maxH is greater than 70 (output "yes" or "no")
if (maxH > 70) "yes" else "no"

# M. Test if minW is greater than the variable 'a' (output "yes" or "no")
if (minW > a) "yes" else "no"

