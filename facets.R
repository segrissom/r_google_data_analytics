#lesson on facets

#as always, start with installing the packages
install.packages("ggplot2")
install.packages("palmerpenguins")
install.packages("tidyverse")

#initiate the packages
library(gggplot2)
library(palmerpenguins)
library(tidyverse)

#facets let you display smaller groups or subsets of data
#ggplot2 has two ways to access facets: facet_wrap() and facet_grid()

colnames(penguins)

#facet_wrap is the way to facet the plot based on a single variable
ggplot(data = penguins)+geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g,color=species))+facet_wrap(~species)

#going to look at the diamonds dataset as well
ggplot(data=diamonds)+geom_bar(mapping=aes(x=color,fill=cut))+facet_wrap(~cut)

#can facet plot with 2 variables using facet_grid()
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+facet_grid(sex~species)
#can do with just 1 variable
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+facet_grid(~species)
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+facet_grid(~sex)

