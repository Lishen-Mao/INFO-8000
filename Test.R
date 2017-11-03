library(tidyverse)
#names(mtcars)
#dim(mtcars)
#mpg help
?mpg

ggplot2::mpg

#give mpg dataset to a variable called "Carmpg"
Carmpg <- ggplot2::mpg

#Adding a layer of points to your plot
#Mapping arguement is always paired with aes()
#The x and y arguments of aes() specify which variables to map to the x and y axes
ggplot(data=mpg) + geom_point(mapping = aes(x = displ, y = hwy))

#put displ on the x-axis and city on the y-axis:
ggplot(data=mpg) + geom_point(mapping = aes(x = displ, y = cty))

#make a plot of hwy and cyl
ggplot(data=mpg) + geom_point(mapping = aes(x = cyl, y = hwy))

#make a plot of class verse drv, but it is not useful
ggplot(data=mpg) + geom_point(mapping = aes(x = class, y = drv))

#show a empty graph
ggplot(data=mpg)