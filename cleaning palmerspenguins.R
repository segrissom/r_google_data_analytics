#installing 3 packages for data cleaning; here makes referencing files easier
#skimr makes summarizing the data easier, and janitor has functions for cleaning
install.packages("here")
install.packages("skimr")
install.packages("janitor")
install.packages("dplyr")

#now need to have them actually installed
library("here")
library("skimr")
library("janitor")
library("dplyr")

#going to look at the palmer penguins again
install.packages("palmerpenguins")
library("palmerpenguins")

#clean up some of the columns by using skim_without_charts, which gives a summary of the dataset 
skim_without_charts(penguins)

#glimpse does something similar, just a different look on it (same with head and others)
glimpse(penguins)

#going to look at the species column by using the select
penguins %>% select(species)

#if i wanted everything but the species column, I'd put a minus in front of hte species column name
penguins %>% select(-species)

#can rename columns with the rename function
penguins %>% rename(island_new = island)

#can also do the rename_with for more consistency, for example, making all of the colnames upper case
rename_with(penguins, toupper)

#can swap back to lower
rename_with(penguins,tolower)

#can do clean_names function as well, which ensures that there's only chars, numbers, and underscores in names
clean_names(penguins)

