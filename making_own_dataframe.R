#can also manually create a dataframe if you want or need to

#going to create a vector for id #
id <- c(1:10)

#a vector for the names
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")

#a vector for the job titles
job_title <- job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

#now going to combine it all into a dataframe
employee <- data.frame(id, name, job_title)

#giong to install the tidyr package
install.packages("tidyr")
library(tidyr)

