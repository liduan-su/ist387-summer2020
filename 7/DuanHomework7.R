################################################

# IST387, Standard Homework Heading
#
# Student name: Liwen Duan 
# Homework number: 7
# Date due: 2020/7/5
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

# Run these three functions to get a clean test of homework code
dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

# Set working directory 
setwd("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/7/") # Change to the folder containing your homework data files

# Your homework specific code goes below here

#################################################
library(readr); library(zipcode); library(ggplot2); library(ggmap); library(maps); library(imputeTS)

#A
mydata <- read_csv("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/7/MedianZIP.csv")

#B
na_mean(mydata)
#

#C
#View(mydata)
str(mydata)
# zip column is stored as num, When the zipcode start with 0, that 0 will deleted. Beside zip we have median, mean and pop - the population of that zipcode region

#D
mydata$zip <- clean.zipcodes(mydata$zip)
data(zipcode)
dfNew <- merge(mydata, zipcode, by="zip")

#E
stateName <- read_csv("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/7/stateNames.csv")
dfNew <- merge(dfNew, stateName, by="state")

#F
us <- map_data("state")
#create us map
dotmap<- ggplot(dfNew, aes(map_id = tolower(name)))
#create ggplot object using dataframe dfNew
dotmap<- dotmap + geom_map(map = us)
#add map layer using us dataframe
dotmap<- dotmap + geom_point(aes(x=longitude,y=latitude,color=Mean))
#set the x-axis as longitiude, y-axis as latitude, fill coler using the mean column in the data frame.
dotmap
#show map

#G
# This map is not good because 
#1. it does not show which point is where
#2. the map is not show in projection

#H
library(sqldf)
dfSimple <- sqldf("select name, SUM(Mean*Pop) as Total, SUM(Pop) as
Pop from dfNew GROUP BY name")

# This SQL query ask for state name, 
#calculate total income by multiplying mean and pop column aliasing as Total, 
#calculate popluation by adding every zip population in the state aliasing as pop. 
#FInally group the data by (state) name.
# There are total 51 row for 50 US states + DC

#I
dfSimple$income <- dfSimple$Total/dfSimple$Pop

#J
us <- map_data("state")
dotmap<- ggplot(dfSimple, aes(map_id = tolower(name), fill = dfSimple$income))
dotmap<- dotmap + geom_map(map = us)
dotmap
dotmap<- dotmap + expand_limits(x = us$long, y = us$lat)
dotmap

#K
dotmap<- dotmap + coord_map(projection = "mercator")
dotmap

