rm(list = ls())

library(leaflet)
library(jsonlite)

map <- fromJSON("https://data.cityofnewyork.us/resource/ig6g-qauv.json", flatten = TRUE)
map <- subset(map, prose_school=="Y" & location_category_description=="High school")

map$longitude <- as.numeric(map$longitude)
map$latitude <- as.numeric(map$latitude)

map <- subset(map, latitude > 30 & longitude < -50)

ProseSchools <- data.frame(latitude= as.numeric(map$latitude),longitude = as.numeric(map$longitude))
ProseSchools %>% leaflet() %>% addTiles() %>% addMarkers()
