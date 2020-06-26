################################################

# IST387, Standard Homework Heading
#
# Student name: Liwen Duan 
# Homework number: 6
# Date due: 2020/6/27
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

#Step 1
#A
air <- airquality
#B
# Data in this data set have multiple interval, including month and day

#Step 2
air$Ozone[is.na(air$Ozone)]
#C
?is.na
#This function show which element are missing.
#D
air$Solar.R[is.na(air$Solar.R)]
air$Wind[is.na(air$Wind)]
air$Temp[is.na(air$Temp)]

#E
#install.packages('imputeTS')
library('imputeTS')

?na_interpolation
air$Ozone <- na_interpolation(air$Ozone)
air$Solar.R <- na_interpolation(air$Solar.R)

#F
#> air$Ozone[is.na(air$Ozone)]
#numeric(0)
#> #This function show which element are missing.
#  > #D
#  > air$Solar.R[is.na(air$Solar.R)]
#numeric(0)

#Step 3
#install.packages('ggplot2')
library('ggplot2')
#G
myPlot	<- ggplot(air,	aes(x=Ozone)) # create a ggplot plot use data source 'air', set the x-axis to Ozone, save it as myPlot
myPlot	<- myPlot	+	geom_histogram(binwidth=5) # generate a histogram with parameter we set in myPlot, set bin width to 5.
myPlot	<- myPlot	+	ggtitle("Histogram	of	Ozone") # Set a title to myPlot Plot as "Histogram	of	Ozone"
myPlot # show myPlot

#H
solarPlot <- ggplot(air, aes(x=Solar.R)) + geom_histogram(binwidth = 10, color="black", fill="white") + ggtitle("Histogram of Solar radiation")
solarPlot
# I Changed the binwidth to 10 to ensure every bin are close to each other. I change color scheme as well for easy to read
windPlot <- ggplot(air, aes(x=Wind)) + geom_histogram(binwidth = 2, color="black", fill="white") + ggtitle("Histogram of Wind")
windPlot
# Because data in wind are more close to each other, i set the bin width to a smaller value to show differences and get more informtion from it.
tempPlot <- ggplot(air, aes(x=Temp)) + geom_histogram(binwidth = 5, color="black", fill="white") + ggtitle("Histogram of Temp")
tempPlot

#Step 4
#I
air$Date	<- as.Date(paste("1973",	airquality$Month,	airquality$Day,	sep="-"))
# This line of code conbine the column Month and Day with additional information year 1973 to generate a date column and added it into air data frame.

#J
myPlot	<- ggplot(air,	aes(x=Date)) # Create ggplot plot use data in air, set the x-axis to Data, save it as myPlot
myPlot	<- myPlot	+ geom_line(aes(y=Ozone)) # Generate a line graph use myPlot, set y-axis to Ozone
myPlot	<- myPlot	+	ggtitle("Ozone	Levels	Over	Time") # Give myPlot a title "Ozone	Levels	Over	Time"
myPlot # show myPlot

#K
solarLinePlot <- ggplot(air, aes(x=Date)) + geom_line(aes(y=Solar.R)) + ggtitle("Solar radiation Level Over Time")
solarLinePlot

windLinePlot <- ggplot(air, aes(x=Date)) + geom_line(aes(y=Wind)) + ggtitle("Wind Level Over Time")
windLinePlot

tempLinePlot <- ggplot(air, aes(x=Date)) + geom_line(aes(y=Temp)) + ggtitle("Temperature Level Over Time")
tempLinePlot

#Expert Mode

# The Ozone Level start growing in June, we are obervate multiple high in begining of July, early Auguest, and begining of September.
# It is interesting when comparing with temperature leven graph, when temperature is high, the ozone level is tend to be high as well. 
# It share a similar pattern of change over the time.

# According to the graph we can see as time move to summer, starting in late May, the tempurature start to growth from aound 65 F to mid Jun's over 90 F.
# The tempreature stay around the same during July, Auguest, and september. Around early Sept. the tempurature start to decline to around 70 F before October.


#Power Expert Mode
solarLinePlot <- ggplot(air, aes(x=Date)) + geom_line(aes(y=Solar.R), color='red') + ggtitle("Solar radiation Level Over Time")
solarLinePlot

myPlot <- ggplot(air,	aes(x=Date)) + geom_line(aes(y=Ozone), color='red') + ggtitle("Ozone	Levels	Over	Time")
myPlot

windLinePlot <- ggplot(air, aes(x=Date)) + geom_line(aes(y=Wind), color='green') + ggtitle("Wind Level Over Time")
windLinePlot

tempLinePlot <- ggplot(air, aes(x=Date)) + geom_line(aes(y=Temp), color='blue') + ggtitle("Temperature Level Over Time")
tempLinePlot

#Ludicrous Power Expert Mode
ozoneTempRelation <- ggplot(air, aes(x=Date)) + geom_line(aes(y=Ozone), color='red') + geom_line(aes(y=Temp), color='blue') + ggtitle("Relationship between Ozone and Temperature") 
ozoneTempRelation

