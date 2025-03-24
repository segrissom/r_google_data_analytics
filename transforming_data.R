#testing out new functions 

#can also manually create a dataframe if you want or need to

#going to create a vector for id #
id <- c(1:10)

#a vector for the names
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")

#a vector for the job titles
job_title <- job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

#now going to combine it all into a dataframe
employee <- data.frame(id, name, job_title)

print(employee)

#going to install the tidyr package
install.packages("tidyr")
library(tidyr)

#going to separate the first and last names
separate(employee, name, into=c('first_name','last_name'), sep = " ")

#going to unite the names, but need them separate in a frame first
first_name <- c("John", "Rob", "Rachel", "Christy", "Johnson", "Candace", "Carlson", "Pansy", "Darius", "Claudia")

last_name <- c("Mendes", "Stewart", "Abrahamson", "Hickman", "Harper", "Miller", "Landy", "Jordan", "Berry", "Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee2 <- data.frame(id, first_name, last_name, job_title)

print(employee2)

#can also unite the functions back
unite(employee2, 'name',first_name,last_name, sep=' ')

#using the mutate function in order to add a column with a calculation for the penguins dataset
install.packages("palmerspenguins")
library(palmerspenguins)
penguins %>% mutate(body_mass_kg = body_mass_g/1000)

#can make more columns that have calculations, don't have to do just one
#ex: we also want to convert the flipper length as well
penguins %>% mutate(body_mass_kg = body_mass_g/1000, flipper_length_m = flipper_length_mm/1000)


