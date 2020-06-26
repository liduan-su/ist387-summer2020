################################################
# IST387, Standard Homework Heading
#
# Student name: Liwen Duan
# Homework number: 5
# Date due: 6/20/2020

# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

# Run these three functions to get a clean test of homework code
#dev.off() # Clear the graph window
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
#This command is a RCurl Command, it let you to download file on a website using curl.


?fromJSON   # What does this function do and what package does it come from?
mydata <- fromJSON(dataset)
### Add your explanation here
#This is function from jsonlite, this command let us to convert dataset's data from JSON to R Data frame.


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
# 3014

sqldf("select count(DAY_OF_WEEK) from myDF where TRIM(DAY_OF_WEEK) = 'FRIDAY' and INJURY='NO'")
### How many accidents on Friday with no injuries
# 1971

# C. What is the total number of accidents on Fridays where there were injuries?
sqldf("select count(DAY_OF_WEEK) from myDF where TRIM(DAY_OF_WEEK) = 'FRIDAY' and INJURY='YES'")
# 1043

# D. Use an SQL query to output a new data frame that only includes accidents with
# injuries that occurred on Fridays. Hint: the query "select * from myDF" returns 
# a data frame containing all of the rows and columns.
fridayInjuries <- sqldf("select * from myDF where TRIM(DAY_OF_WEEK) = 'FRIDAY' and INJURY='YES'")

# E. Use the new data frame to calculate the mean number of vehicles involved in
# accidents with injuries on Fridays?
summary(as.numeric(fridayInjuries$VEHICLE_COUNT))
# 2.006
#OR
sqldf("select avg(VEHICLE_COUNT) from fridayInjuries ")
# 2.006166

# F. Make a histogram of the number of vehicles in accidents on Fridays. Add a comment
# describing the shape of the distribution.
hist(as.numeric(fridayInjuries$VEHICLE_COUNT))
# The data is skew to the right, with the center is in between 1.5 and 2

# G. Make up a query of interest to you and run it to display the result.
pie(table(sqldf("select COUNTY_NAME from myDF where INJURY='YES'")))