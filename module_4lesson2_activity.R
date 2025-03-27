#module 4 lesson 2 activity
#RMD: https://d3c33hcgiwev3.cloudfront.net/algvdUHgT7iYL3VB4B-49g_f8ffabe1fac842d6872cca560da7c9f1_Lesson2_GGPlot.Rmd?Expires=1743206400&Signature=FWpVftgz~aWCOxobj2NWa5RItpneBavycmG7kUSx7afW3cdCAhesC274EJP0~BEMjOhZJ3eiZ3hGnYl8OKPrfRQ8B32m8Z3RsSDhxO23rP42NipztZtI5v9EeHAzTNeZb0AdG0tCJIHBz0K84TBqD69aZCoxes3IKu0TRv4dGkk_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A
install.packages("tidyverse")
install.packages("ggplot2")

library(tidyverse)
library(ggplot2)

hotel_bookings <- read.csv("hotel_bookings3.csv")

colnames(hotel_bookings)

#A stakeholder tells you, "I want to target people who book early, and I have a 
#hypothesis that people with children have to book in advance."
#When you start to explore the data, it doesn't show what you would expect. 
#That is why you decide to create a visualization to see how true that statement is-- or isn't.

ggplot(data = hotel_bookings) + geom_point(mapping = aes(x = lead_time,y = children))

ggplot(data = hotel_bookings) + geom_point(mapping = aes(x = stays_in_weekend_nights, y = children))