#cleaning data of the hotel_bookings csv
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")

library(tidyverse)
library(skimr)
library(janitor)

#going to open/read the file, and assign it bookings_df
bookings_df <- read_csv("hotel_bookings.csv")

#taking a look at the data
skim_without_charts(bookings_df)

#going to clean the data, with a focus on the following variables: hotel, is_canceled, lead_time
trimmed_df <- bookings_df %>% select('hotel', 'is_canceled', 'lead_time')

#going to rename the variable hotel to be hotel_type, because it's more about the type of hotel
trimmed_df %>% select(hotel, is_canceled, lead_time) %>% rename(hotel_type = hotel)

#we can split and combine data in different columns
#for example, combining the arrival month and year into one column using unite()
example_df <- bookings_df %>% select(arrival_date_year, arrival_date_month) %>% unite(arrival_month_year,c("arrival_date_month","arrival_date_year"), sep = " ")
head(example_df)

#can also use the mutate function, as we've seen
#ex: we want to create a column that sums up adults, children, and babies on a reservation for total number of people
example_df2 <- bookings_df %>% mutate(guests = adults + children + babies)
head(example_df2)

#can do summary statistics
#calcaulte the total number of canceled bookings, and average lead time for bookings
#going to store the number canceled into the column called number_canceled

example_df3 <- bookings_df %>% summarize(number_canceled = sum(is_canceled), average_lead_time = mean(lead_time))
head(example_df3)


