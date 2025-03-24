#exploring/using tibbles
install.packages("tidyverse")
library(tidyverse)
data(diamonds)
View(diamonds)

#lets me see the diamonds thing as a tibble
as_tibble(diamonds)

#can assign the tibble to a variable
diamonds_tibble <- as_tibble(diamonds)
