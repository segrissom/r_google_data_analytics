install.packages("tidyverse")
library(tidyverse)

#creating two vectors, of names of people and then of their ages
names <- c("Sarah", "Jake", "Paul", "Elyssa")
age <- c(31,35,35,33)

#creating a dataframe from the two separate vectors
people <- data.frame(names, age)
head(people)
str(people)
colnames(people)
mutate(people, age_in_20 = age+20)

#creating other vectors for frames
fruit <- c("strawberry", "blueberry", "banana", "apple", "kiwi")
ranks <- c(2,4,3,1,5)

fruit_ranks <- data.frame(fruit, ranks)
fruit_ranks