# Run these three functions to get a clean test of homework code
#dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

library(ggplot2); library(maps); library(ggmap); library(mapproj); library(readr)
ny_counties <- map_data("county","new york")
ggplot(ny_counties) + aes(long,lat, group=group) + geom_polygon()

#1
ggplot(ny_counties) + aes(long,lat, group=group) + geom_polygon(fill='white' ,color='black')

#2
head(ny_counties)

#3
ggplot(ny_counties) + aes(long,lat, group=group) + geom_polygon(fill='white' ,color='black') + coord_map(projection = "mercator")
# mercator is a way to project the cylindrical object like earth to 2d surface.

#4
nyData <- read_csv("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/practice/breakout/nyData.csv")

#5
mergeNY <- merge(ny_counties, nyData, all.x = TRUE, by.x = "subregion", by.y = "county")

#6
head(mergeNY)

#7
ggplot(mergeNY) + aes(long,lat, group=group) + geom_polygon(color='black', aes(fill = pop2000)) + coord_map(projection = "mercator")
