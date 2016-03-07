# No scientific notation
options(scipen=999)

#####
# PACKAGES
#####
library(ggthemes)
library(dplyr)
library(xtable)
library(ggplot2)
library(knitr)
library(png)
library(grid)
library(extrafont)
library(tidyr)
library(gridExtra)
library(readxl)
library(raster)
library(maptools)
library(rgeos)
library(ggmap)
source('helpers.R')

if('cleaned_data.RData' %in% dir()){
  load('cleaned_data.RData')
} else {
  #####
  # GET SPATIAL DATA
  moz1 <- getData('GADM', country = 'MOZ', level = 1)
  moz2 <- getData('GADM', country = 'MOZ', level = 2)
  moz3 <- getData('GADM', country = 'MOZ', level = 3)
  
  # Subset for Maputo
  maputo <- moz3[moz3@data$NAME_1 %in% c('Maputo', 'Maputo City'),]
  
  # Fortify everything for ggplot
  maputo_fortified <- fortify(maputo, region = 'NAME_3')
  moz1_fortified <- fortify(moz1, region = 'NAME_1')
  moz2_fortified <- fortify(moz2, region = 'NAME_2')
  moz3_fortified <- fortify(moz3, region = 'NAME_3')
  
  # Get satellite visuals too
  sat_4 <- 
    get_map(location = c(32.806249, -25.405572), zoom = 4, maptype = 'satellite')
  sat_5 <- 
    get_map(location = c(32.806249, -25.405572), zoom = 5, maptype = 'satellite')
  sat_6 <- 
    get_map(location = c(32.806249, -25.405572), zoom = 6, maptype = 'satellite')
  sat_7 <- 
    get_map(location = c(32.806249, -25.405572), zoom = 7, maptype = 'satellite')
  sat_8 <- 
    get_map(location = c(32.806249, -25.405572), zoom = 8, maptype = 'satellite')
  sat_9 <- 
    get_map(location = c(32.806249, -25.405572), zoom = 9, maptype = 'satellite')
  sat_10 <- 
    get_map(location = c(32.806249, -25.405572), zoom = 10, maptype = 'satellite')
  sat_11 <- 
    get_map(location = c(32.806249, -25.405572), zoom = 11, maptype = 'satellite')
  sat_12 <- 
    get_map(location = c(32.806249, -25.405572), zoom = 12, maptype = 'satellite')
  sat_13 <- 
    get_map(location = c(32.806249, -25.405572), zoom = 13, maptype = 'satellite')

  save.image('cleaned_data.RData')
  
  }