#installing the packages for the assignment
install.packages("palmerspenguins")
install.packages("tidyverse")

library("palmerpenguins")
library(tidyverse)

#going to arrange the data based on the length of the bill of the penguins
penguins %>% arrange(bill_length_mm)

#auto does it in ascending order - if want descending, put a - in front of colname
penguins %>% arrange(-bill_length_mm)

#right now, the data is just essentially only in console, if i want it as a df, need to assign it
penguins2 <- penguins %>% arrange(-bill_length_mm)

view(penguins2)

#putting the data in to penguins2 lets me manipulate data without changing the original dataset

#can also use the groupby function in order to... group by - but is usually combined with other functions
#for example - group by island, then summarize to get the mean_bill_length
#recall: summarize gives you an overview of the data 
#there can be missing values, so will feed it through the drop_na command
penguins %>% group_by(island) %>% drop_na() %>% summarize(mean_bill_length_mm = mean(bill_length_mm))

#be careful wiht using drop_na function, since it'll drop data that's nonexistent

#if we want to know the maximum bill_length, we can use a summary function for that as well
penguins %>% group_by(island) %>% drop_na() %>% summarize(max_bill_length = max(bill_length_mm))

#can group by two different things (ex: island and species)
penguins %>% group_by(island,species) %>% drop_na() %>% summarize(max_bill_length = max(bill_length_mm))
penguins %>% group_by(island,species) %>% drop_na() %>% summarize(mean_bill_length_mm = mean(bill_length_mm))

#could do in one step as well
penguins %>% group_by(island,species) %>% drop_na() %>% summarize(max_bill_len = max(bill_length_mm), mean_bill_len = mean(bill_length_mm))

#can filter the results so we only see the Adelie penguins
penguins %>% filter(species == "Adelie")


