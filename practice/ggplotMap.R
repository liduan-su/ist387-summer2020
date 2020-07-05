# Run these three functions to get a clean test of homework code
dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

library("ggplot2")
library("RCurl")
library("jsonlite")
library('ggmap') 

dummyDF <- data.frame(state.name,stringsAsFactors = FALSE)

dummyDF$state <- tolower(dummyDF$state.name)

us <- map_data("state")
map.simple <- ggplot(dummyDF, aes(map_id = state))
map.simple
map.simple <- map.simple+geom_map(map = us, fill="white", color="black")
map.simple
map.simple <- map.simple+expand_limits(x = us$long, y = us$lat)
map.simple
map.simple <- map.simple+coord_map() + ggtitle("basic map of USA")
map.simple
map.simple + geom_point(aes(x=-76,y=43))

geocode('syracuse university')


