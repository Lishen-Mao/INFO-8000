#Load necessary library
library(dplyr);
library(tidyverse)

#Set working directory to my flashdrive
setwd("D:/Marsh data/")

#MarshSR means "Marsh surface reflectance", read the data from my csv file into 'MarshSR'.
MarshSR<-read.csv("modis500m_gulfcoast_processed.csv")

#Create a new column 'NDVI' and Calculate its value for each row in MarshSR dataset.
MarshSR$NDVI <- ((MarshSR$band2-MarshSR$band1)/(MarshSR$band2+MarshSR$band1))

#Filter the data in my MarshSR dataset where pixel equals 'SW' and site equals 'BS', and copy these data to a new variable
BSSWNDVI<-subset(MarshSR, pixel == "SW" & site == "BS")
#Filter the data in my MarshSR dataset where pixel equals 'SE' and site equals 'BS', and copy these data to a new variable
BSSENDVI<-subset(MarshSR, pixel == "SE" & site == "BS")

##put date on the x-axis and NDVI on the y-axis:
ggplot(data=BSSENDVI) + 
  geom_line(mapping = aes(x = date, y = NDVI, group = 1)) +
  labs(x = "2015 to 2016", y = "NDVI", title = "NDVI value in SW and SE pixels of Bayou Sauvage National wildlife refuge")
