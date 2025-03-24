#module 3, lesson 2

install.packages("tidyverse")
library(tidyverse)

#import the data
bookings_df <- read_csv("hotel_bookings.csv")
head(bookings_df)
str(bookings_df)

colnames(bookings_df)

#can create a new df which focuses on average daily rate (adr)  and adult columns in the bookings_df 
new_df <- select(bookings_df, 'adr', adults)
head(new_df)

#to create new variables into a dataframe, you want to use the mutate function
#the code below creates a new column about called total
mutate(new_df, total = 'adr'/adults)
head(new_df)