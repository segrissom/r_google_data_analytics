#visualizing data with ggplot2 
#from module 4

install.packages("ggplot2")
install.packages("palmerpenguins")
library(ggplot2)
library(palmerpenguins)

data(penguins)
View(penguins)

#plotting the flipper length vs body mass
ggplot(data = penguins) + geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))
#data = penguins lets ggplot know that I am looking at data from there
#the + sign is letting my add a new layer to the plot, which you need one or more of in order to plot
#geom_point uses points to create scatterplots
#if I did geom_bar, it wouuld make bar charts, etc.

#making my own plot - going to compare flipper length to gender... grouped by the type
p <- ggplot(data = penguins, aes(x=sex, y=flipper_length_mm, color = species)) + geom_boxplot()
p

