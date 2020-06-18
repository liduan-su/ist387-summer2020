################################################
# IST387, Standard Homework Heading
#
# Student name:
# Homework number: 5
# Date due: 

# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor
# 2. I did this homework with help from the book and the professor and these Internet sources:
# 3. I did this homework with help from <Name of another student> but did not cut and paste any code

# Run these three functions to get a clean test of homework code
dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment
##########################################################################

#-------------------------------------------------------------------------
# The following starter code will help you retrieve and transform the data
# from the State of Maryland open data API
#-------------------------------------------------------------------------
# First, install and "library" new packages:

#install.packages("RCurl") # Uncomment this if you need to install from the web
library(RCurl)
#install.packages("jsonlite") # Uncomment this if you need to install from the web
library(jsonlite)

#-------------------------------------------------------------------------
# Next, retrieve and examine the data from the URL
?getURL   # What does this function do and what package does it come from?
dataset <- getURL("http://opendata.maryland.gov/api/views/pdvh-tf2u/rows.json?accessType=DOWNLOAD")
### Add your explanation here

?fromJSON   # What does this function do and what package does it come from?
mydata <- fromJSON(dataset)
### Add your explanation here

str(mydata[[1]]) # The metadata, including variable names, is stored here
str(mydata[[2]]) # The data matrix is stored here
myDF <- as.data.frame(mydata[[2]], stringsAsFactors = F) # Convert the data matrix to data frame
colnames(myDF) <- mydata[["meta"]][["view"]][["columns"]][["name"]] # Add the variable names from the metadata
str(myDF) # Note that every column has been turned character data!!!

#-------------------------------------------------------------------------
# Finally, we are ready to run some SQL queries
#install.packages("sqldf") # Uncomment this if you need to install from the web
library(sqldf)

sqldf("select count(DAY_OF_WEEK) from myDF where TRIM(DAY_OF_WEEK) = 'FRIDAY'")
### How many accidents on Friday

sqldf("select count(DAY_OF_WEEK) from myDF where TRIM(DAY_OF_WEEK) = 'FRIDAY' and INJURY='NO'")
### How many accidents on Friday with no injuries