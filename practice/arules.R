# Run these three functions to get a clean test of homework code
#dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

#install.packages('arules')
library('arules')

#install.packages('arulesViz')
library(arulesViz)

# Groceires Data

data("Groceries")
length(Groceries)
str(Groceries)

data <- Groceries@data
str(data)
rowMeans(data) 
str(Groceries@itemInfo)
Groceries@itemInfo[1,]
labels <- Groceries@itemInfo[,1]
labels [1:10]

df <- data.frame(rowMeans(data), labels, Groceries@itemInfo$level2)
df[11,]

df1 <- df[order(-df$rowMeans.data.),]
# Sorting based on -df$rowMeans.data.
df1[1:10,]

df[df$rowMeans.data.> 0.08,]


