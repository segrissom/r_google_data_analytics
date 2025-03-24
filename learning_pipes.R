##notes on using pipes in R
#a way to think about being able to code the phrase "and then"
#Ex: Call up data (and then) Group the data (and then) Summarize the grouped data using a mean function
install.packages("tidyverse")
library(tidyverse)
data("ToothGrowth")
View(ToothGrowth)

#say we need to organize data by filtering, need to run dplyr first
install.packages("dplyr")
library(dplyr)
#assigning a name to the data to then apply the filter
filtered_tg <- filter(ToothGrowth, dose ==0.5)
filtered_tg

#arranging data in ascending order, based on the length column
arrange(filtered_tg, len)

#we can more effectively nest this function
arrange(filter(ToothGrowth, dose == 0.5), len)
#with nested functions, we read from the inside out - so starting with reading the toothgrowth, then moving out

#we can also use a pipe
#ctrl+shift+m on pc/chromebooks to quick insert the pipe operator
#on a mac it's cmd+shift+m
filtered_tg2 <- ToothGrowth %>% filter(dose==0.5) %>% arrange(len)
filtered_tg2
#starting pipe by assigning it to a variable; then we wrote the data set we
#want to look at, and then R will apply the data set to the following commands

#say we want to look at the toothgrowth based by the grouping of the supplements
filtered_toothgrowth <- ToothGrowth %>% filter(dose == 0.5)%>% group_by(supp) %>% summarize(mean_len= mean(len, na.rm = T), .group="drop")
filtered_toothgrowth