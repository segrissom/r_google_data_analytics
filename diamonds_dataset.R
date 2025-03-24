##a file running through some basic functions and visualizations using the diamonds plot
install.package("tidyverse")
library(tidyverse)
#check ot the diamonds data set
head(diamonds)
#returns summaries
str(diamonds)
glimpse(diamonds)
#check out the column names:
colnames(diamonds)
#renaming a column
rename(diamonds, carat_new=carat)
rename(diamonds, carat_new=carat, cut_new = cut)
#can use it to generate a variety of summary statistics; ex below calculates the mean)
summarize(diamonds, mean_carat = mean(carat))
#make a plot to visualize the carats and price
ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point()
#going to creat a cisual for each type of cut
ggplot(data=diamonds, aes(x=carat, y=price, color = cut))+ geom_point() + facet_wrap(~cut)
