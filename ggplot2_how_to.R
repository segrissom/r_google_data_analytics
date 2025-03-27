#getting started with ggplot() module 4... again

#as always, start with installing the packages
install.packages("ggplot2")
install.packages("palmerpenguins")
install.packages("tidyverse")

#initiate the packages
library(gggplot2)
library(palmerpenguins)
library(tidyverse)

#plotting the body mass against the flipper length...again... as a scatter
ggplot(data=penguins) + geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))
#generally, shows a linear relationship 

#every ggplot2 plot starts with ggplot() in order to establish the data you're working with
#then we add a layer to the plot by adding the geom_point, setting that points represent our data
#adding geom functions are the second step in making the plot
#aes is short for aesthetic omg it makes so much more sense
#mapping=aes tells ggplot to match up a specific variable to a specific aesthetic; like mapping a variable to the x axis and y axis
#mapping aesthetics to variables is the third step in creating a plot

#in general, to create a plot, the steps are...
#stat with ggplot function and select dataset
#add a geom_ function in order to display the data
#map the variables to plot in the argument of the aes function.

#can make a more functional/reusable application
#ggplot(data = <DATA>)+ <GEOM_FUNCTION>(mapping=aes(<AESTHETIC MAPPINGS>))


