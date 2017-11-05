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

##put date on the x-axis and NDVI on the y-axis, line graph
#From this plot, it is hard to tell which pixel has more consistent and higher NDVI value
ggplot(data=BSSENDVI) + 
  geom_line(mapping = aes(x = date, y = NDVI, group = 1), color = rgb(0,0,0, alpha = 0.2))+
  geom_line(data = BSSWNDVI, mapping = aes(x = date, y = NDVI, group = 1), color = rgb(0,0,1, alpha = 0.3)) +
  labs(x = "2015 to 2016", y = "NDVI", title = "SW and SE pixel NDVI value in Bayou Sauvage National wildlife refuge")

#mean NDVI 
meanNDVI <- mean ((BSSENDVI$NDVI+BSSWNDVI$NDVI)/2)

###put date on the x-axis and NDVI on the y-axis, point graph
ggplot(data=BSSENDVI) + 
  geom_point(mapping = aes(x = date, y = NDVI, group = 1), color = rgb(0,0,0, alpha = 0.2))+
  geom_point(data = BSSWNDVI, mapping = aes(x = date, y = NDVI, group = 1), color = rgb(0,0,1, alpha = 0.3)) +
  labs(x = "2015 to 2016", y = "NDVI", title = "SW and SE pixel NDVI value in Bayou Sauvage National wildlife refuge")+
  geom_hline(yintercept = meanNDVI)



abline(h=meanNDVI)
