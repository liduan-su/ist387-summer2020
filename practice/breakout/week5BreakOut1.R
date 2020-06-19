##########
# IST 387 Week5BreakOut
# Liwen Duan
# 6/18/2020
##########

# This code fragment is for the first breakout group
setwd("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/practice/breakout") # Change to the folder containing your homework data files
load('CitiBikeData.RData')

#4. Create a table that summarizes the "statusValue" of all of the stations in myDF.
#Take note of how many stations were in service and how many were not.
statusValueTable <- table(myDF$statusValue)
print(statusValueTable)
# there are 964 station in station, and 9 are not in service.

#5. Run this command and interpret what you see:
  plot(myDF$longitude, myDF$latitude)
# I am looking at a dotted graph on there with data of latitute and longtitude. I believe if i overlay this graph on a NYC map, i will be ablt to get location in real life.
  
# This code fragment is for the second breakout group
library(sqldf)
  #myDF <- apiData$stationBeanList
  myNumericData <- sqldf("Select totalDocks, availableDocks, availableBikes from
myDF")
  
#6. The code fragment above can be used to test out a simple SQL query using the
#data stored in myDF. Note that you may have to install the sqldf package to make
#this code work. Run the SQL query and use str( ) to examine the results.
str(myNumericData)
  
#7. Calculate a new variable which is the difference between totalDocks and
#availableDocks. Run a histogram on this variable and review the distribution.
myDF$occupiedDocks <- myDF$totalDocks-myDF$availableDocks
hist(myDF$occupiedDocks)

#8. Your new variable represents how many docks are occupied by bikes, so it
#should be similar or identical to availableBikes. Run a plot( ) command that
#produces an X-Y plot with the number of occupied docks on the X-axis and
#availableBikes on the Y-axis. Make sense of the results.
plot(myDF$occupiedDocks,myDF$availableBikes)

#9. Save all of your code in a .R file and email it to cndunham@syr.edu