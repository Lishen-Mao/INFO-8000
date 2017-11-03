library(tidyverse)
#names(mtcars)
#dim(mtcars)
#mpg help
#?function_name to get the help
?mpg
?geom_point
ggplot2::mpg
p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point()
cars <- ggplot2:::mtcars
#give mpg dataset to a variable called "Carmpg"
Carmpg <- ggplot2::mpg

#Adding a layer of points to your plot
#Mapping arguement is always paired with aes()
#The x and y arguments of aes() specify which variables to map to the x and y axes
ggplot(date = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
ggplot(mpg, aes(displ, hwy)) + geom_point()

#put displ on the x-axis and city on the y-axis:
ggplot(data=mpg) + geom_point(mapping = aes(x = displ, y = cty))

#make a plot of hwy and cyl
ggplot(data=mpg) + geom_point(mapping = aes(x = cyl, y = hwy))

#make a plot of class verse drv, but it is not useful
ggplot(data=mpg) + geom_point(mapping = aes(x = class, y = drv))

#show a empty graph
ggplot(data=mpg)

#map the colors of mpg plot, legend and unique color"here" will be assigned to value automatically.
ggplot(data=mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))
#map the size of mpg plot
ggplot(data=mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = class))
#map class to the alpha aesthetic, which controls the transparency of the points
ggplot(data=mpg) + geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
#map class to the different shape of points, but ggplot2 only use six shapes at a time, therefore SUV is unplotted.
ggplot(data=mpg) + geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#set the asethetic properties of my geom manually. For example, making all of the points in our plot blue.
ggplot(data=mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#facet plot by a single variable. the number of rows only controls how to display the output pltos in console.
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap(~ class, nrow = 2)

#facet plot on the combination of two variables.
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_grid(drv ~ cyl)
#This plot shows that no car coms with rear wheel drive and 4 or 5 cylinders.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

#compare 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv~.)
#If you prefer to facet in one dimension use a ."dot"
#facet_wrap(~ cyl, nrow=1) = facet_grid(.~cyl)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ cyl, nrow=1)
