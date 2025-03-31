#exercise on using the anotation layer on ggplot
install.packages("ggplot2")
install.packages("tidyverse")
library("ggplot2")
library("palmerpenguins")

#you use the 'labs' function to add titles and subtitles, and labs is short for labels
ggplot(data=penguins)+
	geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g, color=species))+labs(title="Palmer Penguins: Body Mass vs. Flipper Length",subtitle = "Sample of Three Penguins Species")

#can add a caption
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g, color=species))+labs(title="Palmer Penguins: Body Mass vs. Flipper Length",subtitle = "Sample of Three Penguins Species",caption="Data collected by Dr. Kristen Gormen")

#if we want to add text to specific points, have to use the annotate fucntion
ggplot(data=penguins)+
	geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g, color=species))+labs(title="Palmer Penguins: Body Mass vs. Flipper Length",subtitle = "Sample of Three Penguins Species",caption="Data collected by Dr. Kristen Gormen")+annotate("text",x=220,y=3500,label="The Gentoos are the largest", color='purple',fontface="bold",size=4.5,angle=25)



#code is very long, can store it in a variable and then add the annotate function

p <- ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g, color=species))+labs(title="Palmer Penguins: Body Mass vs. Flipper Length",subtitle = "Sample of Three Penguins Species",caption="Data collected by Dr. Kristen Gormen")

p+annotate("text",x=220,y=3500,label="The Gentoos are the largest", color='purple',fontface="bold",size=4.5,angle=25)