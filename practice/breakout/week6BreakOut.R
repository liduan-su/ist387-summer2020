# Run these three functions to get a clean test of homework code
dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment


library('ggplot2')

#1 - create plot use dataset economics, x-axis is date, y-axis is Personal Saving Rate
myPlot <- ggplot(economics, aes(x=date))
myPlot # the x-axis and background of the plot was created 
myPlot <- myPlot + geom_line(aes(y=psavert))
myPlot # the was added on to the plot

#2
help("economics")

#3
myPlot

#4
which.max(economics$psavert) #95
which.min(economics$psavert) #457

#5 - change color of line to green
myPlot <- ggplot(economics, aes(x=date)) + geom_line(aes(y=psavert), colour='green')
myPlot

#6 - add title for plot
myPlot <- myPlot + ggtitle("Personal Savings Rate: 1967-2014")
myPlot

#7 add uempmed as red line into plot
myPlot <- myPlot + geom_line(aes(y=uempmed), colour='red')
myPlot

#8 - change title for the plot
myPlot <- myPlot + ggtitle("Relationship between Personal Savings Rate and median weekly Umployment rate: 1967-2014")
myPlot

#9 -  Add axis lable for plot
myPlot <- myPlot + ylab("Personal Savings(%) | median duration of unemployment(weeks)")
myPlot
