#module 4, lessons on smoothing

#as always, start with installing the packages
install.packages("ggplot2")
install.packages("palmerpenguins")
install.packages("tidyverse")

#initiate the packages
library(gggplot2)
library(palmerpenguins)
library(tidyverse)

#making a smoothhhhh line
ggplot(data=penguins) + geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g)) + geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g))

#say we want it to show our beauties per species
ggplot(data=penguins) + geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g,linetype = species))