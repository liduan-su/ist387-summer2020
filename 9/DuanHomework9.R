################################################

# IST387, Standard Homework Heading
#
# Student name: Liwen Duan 
# Homework number:9 
# Date due: 2020/7/25
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

# Run these three functions to get a clean test of homework code
dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

# Set working directory 
setwd("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/9/")# Change to the folder containing your homework data files
#setwd("C:/Users/liduan/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/9")
# Your homework specific code goes below here

#################################################
load(file = "titanic.raw.RData")
badboat <- titanic.raw

#Pt. 1
#A
View(badboat)
#This dataset contain four piece of information,
#Including Class, Sex, Age and Survived. 
#Class has 1st, 2nd, 3rd and Crew.
#Sex Including Male and Female.
#Age has Adult and Child
#Survived has yes and no.

#B
table(badboat$Survived)
#  No  Yes 
#1490  711 

#C
prop.table(table(badboat$Survived))
#      No      Yes 
#0.676965 0.323035 

#D
#Class
prop.table(table(badboat$Class))
#Sex
prop.table(table(badboat$Sex))
#Age
prop.table(table(badboat$Age))

#E
prop.table(table(badboat$Age, badboat$Sex))
#This table shows the majority of passengers are Male adult, at 75.74%
#followed by Female Adult of 19.31%
#rest of the passengers are children, 2.91% are male child, and
#2.04% are female child.

#Pt. 2
#F
#install.packages('arules')
library('arules')

#install.packages('arulesViz')
library(arulesViz)

#G
badboatX <- as(badboat, "transactions")

#H
inspect(badboatX)
# This command list every rows as a transaction.
itemFrequency(badboatX)
# This command show frequency or percentage of passenger of each column/ category. 
itemFrequencyPlot(badboatX)
# This command turn itemFrequency(badboatX) into a bar chart

#I
View(badboatX)
#the badboatX contain three parts - data, itemInfo, and itemsetInfo
#data contain raw data and dimension 
#itemInfo contain information like label and all the relation/ruleset
#itemsetInfo contain how many data in the dataset.

#J
#The badboat is a data frame just contain the raw data
#The badboatX is a processed data that show all the relation/ruleset happen between each column for further analysis.

#Pt. 3
#K
ruleset <- apriori(badboatX,
                   parameter=list(support=0.005,confidence=0.5),
                   appearance = list(default="lhs", rhs=("Survived=Yes")))
#L
inspect(ruleset)

#M
# By looking at lift and confidence data, I am observing two ruleset contain some interesting result.
# ruleset {Class=2nd,Age=Child} and {Class=2nd,Sex=Female,Age=Child} have lift of 3.096, and confidence of 1 which is 100% confidence,
# so I am certain that second class children or second class female children are survived in the disaster. 
# support for {Class=2nd,Age=Child} is 0.011, support for {Class=2nd,Sex=Female,Age=Child} is 0.006. 

#N
inspectDT(ruleset)

