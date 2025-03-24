#working on using data frames, by using the diamonds dataset
install.packages("tidyverse")
library(ggplot2)
data(diamonds)
View(diamonds)
head(diamonds)
#recall that str essentially gives you the breakdown of the structurs
str(diamonds)
#to just get our column names, do colnames
colnames(diamonds)
#mutate function lets us add columns
library(tidyverse)
mutate(diamonds, carat_2 = carat*100)