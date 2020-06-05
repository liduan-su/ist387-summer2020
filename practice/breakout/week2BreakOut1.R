myIris <- iris
help("iris")
summary(myIris)
myIris$Sepal.Length
sort(myIris$Sepal.Length)
order(myIris$Sepal.Length)
#Difference between sort and order
help("sort")
help("order")
myIris <- myIris[order(myIris$Sepal.Length),]
View(myIris)
