#module 4 hands on activity for aesthetics and visualizations

install.packages("tidyverse")
install.packages("ggplot2")

library(tidyverse)
library(ggplot2)

hotel_bookings <- read.csv("hotel_bookings3.csv")
ggplot(data=hotel_bookings)+geom_bar(mapping=aes(x=distribution_channel))

ggplot(data=hotel_bookings)+geom_bar(mapping=aes(x=distribution_channel,fill=deposit_type))

#chaing fill to market_segment
ggplot(data=hotel_bookings)+geom_bar(mapping=aes(x=distribution_channel,fill=market_segment))

ggplot(data = hotel_bookings) + geom_bar(mapping = aes(x = distribution_channel)) +facet_wrap(~deposit_type)

#can change x-axis labels to be at an angle so they're easier to read
ggplot(data = hotel_bookings) + geom_bar(mapping = aes(x = distribution_channel)) + facet_wrap(~deposit_type) +theme(axis.text.x = element_text(angle = 45))

#could change it to be a different chart for each market_segment
ggplot(data = hotel_bookings) + geom_bar(mapping = aes(x = distribution_channel)) + facet_wrap(~market_segment) +theme(axis.text.x = element_text(angle = 45))