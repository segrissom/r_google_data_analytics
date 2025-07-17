#following the google data analytics walk through

#helps to wrangle the data
library(tidyverse) 
#use the conflicted package in order to manage the conflicts that pop up
library(conflicted)

#going to set the dply::filter and dplyr::lag as the default choices
conflict_prefer("filter","dplyr")
conflict_prefer("lab","dplyr")

#now going to load in the data 
q1_2019 <- read.csv("C:/Users/segri/OneDrive/Documents/R scripts/case_study_bikes/bike_trip_follow_along/2019_divvy_tripsQ1.csv")
q1_2020 <- read.csv("C:/Users/segri/OneDrive/Documents/R scripts/case_study_bikes/bike_trip_follow_along/2020_divvy_tripsQ2.csv")

#now going to compare the column names and confirm that they match up correctly
colnames(q1_2019)
colnames(q1_2020)

#not all of the columns have the same name, so I need to reformat them
#going to update the 2019 cols to match the 2020
(q1_2019 <- rename(q1_2019, ride_id = trip_id,
                   rideable_type = bikeid,
                   started_at = start_time,
                   ended_at = end_time,
                   start_station_name = from_station_name,
                   start_station_id = from_station_id,
                   end_station_name = to_station_name,
                   end_station_id = to_station_id,
                   member_casual = usertype))
#now going to inspect the dataframes and look for incongruencies
str(q1_2019)
str(q1_2020)

#ride_id and #rideable_type aren't matching, going to convert 2019 to also being char
q1_2019 <- mutate(q1_2019, ride_id =as.character(ride_id),rideable_type = as.character(rideable_type))

#now going to stack the quarter's data frames into one big one
all_trips <- bind_rows(q1_2019, q1_2020)

#remove the unnecessary information form 2019/stuff that didn't get input into the 2020, so they match better
all_trips <- all_trips %>%
  select(-c(start_lat, start_lng, end_lat, end_lng, birthyear,gender,"tripduration"))


#now going to clean up (further?), and even add data to prepare for analysis

#going to inspect the new table to make sure it translated correctly
colnames(all_trips)
#see how many rows of data now
nrow(all_trips)
#see the dimensions of the data
dim(all_trips)
#going to check out the head of the dataframe
head(all_trips)

#now confirm the data types of the columns
str(all_trips)
#do a statistical summary of all the data, mainly for numerics
summary(all_trips)

#interestingly, the dates information are currently character based
#in the member_type, we see that tehre are subscribers and members, along with customers and casuals
#want to make sure to add the ride_legnth since 2020 didn't have that column, it looks like

#going to start with correcting the member_casual column with just two types for simplification
#going to see how many observations fall under each user type
table(all_trips$member_casual)

#reassign the desired values
all_trips <-all_trips %>%
  mutate(member_casual=recode(member_casual, 
                              "Subscriber" = "member",
                              "Customer" = "casual"))

#now goign to check that it went through
table(all_trips$member_casual)

#running into the posx issue
#could be to do with the some issue where the bikes were taken out of docks and checked by Divvy OR ride_length is negative...
#going to try to force it through with the following:

all_trips$started_at <- as.POSIXlt(all_trips$started_at, format = "%m/%d/%Y %H:%M", tz = "EST")
all_trips$ended_at <- as.POSIXlt(all_trips$ended_at, format = "%m/%d/%Y %H:%M", tz = "EST")
all_trips$ride_length <- difftime(all_trips$ended_at, all_trips$started_at)

#going to add columns that are specifically have hte date, month, day, and year for each ride
#the default date method is yyyy-mm-dd
all_trips$date<-as.Date(all_trips$started_at)
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date),"%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

#now going to add a ride_length to all_trips (based in seconds)
all_trips$ride_length <- difftime(all_trips$ended_at, all_trips$started_at)

#now going to inspect the cols again
str(all_trips)

#going to convert the ridelength from factor to numeric, as that ight be causing the issue
is.factor(all_trips$ride_length)
#the test says that it's not???
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))
is.numeric(all_trips$ride_length)
#it wasn't numeric prior, but post having converted, I believe it eliminated the NA options and now they all are numeric

#going to remove more "bad" data
all_trips_v2 <- all_trips[!(all_trips$start_station_name == "HQ QR"| all_trips$ride_length<0),]

#now going to run descriptive analysis on ride-length
mean(all_trips_v2$ride_length, na.rm=TRUE)
median(all_trips_v2$ride_length, na.rm=TRUE)
max(all_trips_v2$ride_length, na.rm=TRUE)
min(all_trips_v2$ride_length, na.rm=TRUE)
#lines 96-98 fixed it!!!!!!!!

summary(all_trips_v2$ride_length)

#compare the numbers between the casual and the member riders
aggregate(all_trips_v2$ride_length ~all_trips_v2$member_casual, FUN = mean)
aggregate(all_trips_v2$ride_length ~all_trips_v2$member_casual, FUN = median)
aggregate(all_trips_v2$ride_length ~all_trips_v2$member_casual, FUN = max)
aggregate(all_trips_v2$ride_length ~all_trips_v2$member_casual, FUN = min)

#so the casual members have, on average, higher ride lengths/all metrics, tbh

#now going to see the average ride time, by day, for members vs casual riders
#notably, the days are out of order
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week,levels=c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"))

#now we can run the average ride time by each day for members vs casual members
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)

#going to analyze data by type and weekday
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label= TRUE)) %>%
  group_by(member_casual,weekday) %>%
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%
  arrange(member_casual,weekday)

#lets visualize the number of rides by rider type
all_trips_v2 %>% 
  mutate(weekday =wday(started_at, label = TRUE)) %>%
  group_by(member_casual,weekday) %>%
  summarise(number_of_rides= n(), average_duration = mean(ride_length)) %>%
  arrange(member_casual, weekday) %>%
  ggplot(aes(x=weekday, y=number_of_rides, fill=member_casual)) + geom_col(position="dodge")

#now a viz for the average duration
all_trips_v2 %>%
  mutate(weekday =wday(started_at, label = TRUE)) %>%
  group_by(member_casual,weekday) %>%
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%
  arrange(member_casual,weekday) %>%
  ggplot(aes(x=weekday,y=average_duration,fill=member_casual)) + geom_col(position = "dodge")
