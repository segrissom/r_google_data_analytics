#hands on activity in module 4
#will be working with the hotel_bookings_data
install.packages('ggplot2')
install.packages('tidyverse')

library(ggplot2)
library(tidyverse)

#loading the data up into the hotel_bookings df
hotel_bookings <- read.csv("hotel_bookings.csv")

head(hotel_bookings)

#this is a chart we created before, in a different exercise
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel)

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title="City Hotels vs. Resort Hotel Booking Types")

#going to add more detail about when this data was taken, by pulling out the minimum year date
min(hotel_bookings$arrival_date_year)

#and the max year as well
max(hotel_bookings$arrival_date_year)

#going to store these in variables
mindate <- min(hotel_bookings$arrival_date_year)
maxdate <- max(hotel_bookings$arrival_date_year)

#going to add a subtitle to the previous graph
#can use the paste0()function to use the variables that I just created up above
ggplot(data = hotel_bookings) + 
	geom_bar(mapping=aes(x=market_segment))+
	facet_wrap(~hotel) +
	labs(title = "City Hotels vs. Resort Hotel Booking Types",
	subtitle = paste0("Data From: ", mindate, " to ", maxdate))

#can also use the caption() function over the subtitle function - this will move the text to bottom right corner instead
ggplot(data = hotel_bookings) + 
	geom_bar(mapping=aes(x=market_segment))+
	facet_wrap(~hotel) +
	labs(title = "City Hotels vs. Resort Hotel Booking Types",
	caption = paste0("Data From: ", mindate, " to ", maxdate))
#this works better for this set of data, because the dates, while important
#don't need to be up top

#want to clean up the axis titles, as they say Count and mark_segment, by using the labs() function
ggplot(data = hotel_bookings) +
	geom_bar(mapping=aes(x=market_segment))+
	facet_wrap(~hotel) + 
	labs(title = "City Hotels vs. Resort Hotel Booking Types",
	caption = paste0("Data From: ", mindate, " to ", maxdate), 
	y = "Number of Bookings", x = "Market Segment")
##ggplot, when using ggsave, will automatically save it as a 7x7
