#goal of this exercise is to learn how to sace plots
install.packages(ggplot2)
install.packages(palmerpenguins)

library(ggplot2)
library(palmerpenguins)

ggplot(data=penguins) + 
	geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species)

#can save the plot up in the top left once selected in the file tab

#or can use the ggsave function as well
#ggsave() saves the most recent plot that was made - so it would make the one above
#need to give it hte file name and the type of file you want it to be saved as
ggsave("Three Penguin Species.png")
