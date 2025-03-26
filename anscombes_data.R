#going to use the module 3 skills on the quartet data
#install the required packages in order to look at the anscombe's quartet data
install.packages("Tmisc")
install.packages("tidyverse")
library(tidyverse)
library(Tmisc)
data(quartet)
View(quartet)

#going to look at the statistics on the data, based on the set
quartet %>% group_by(set) %>% summarize(mean(x), sd(x), mean(y), sd(y), cor(x,y))
#cor is measuring the correlation of these values

#interstingly in III set, the mean of y is less precise (presumed by lack of 0)

#these datasets look identical so far - going to visualize with ggplot in order to see if they are 

#https://www.coursera.org/learn/data-analysis-r/lecture/Rf92j/same-data-different-outcome
ggplot(quartet,aes(x,y)) + geom_point() + geom_smooth(method=lm,se=FALSE) + facet_wrap(~set)


#datasauRus package creates plots with VERY different shapes
install.packages('datasauRus')
library('datasauRus')

#now create a plot to show the types of shapes that datasauRus can make
ggplot(datasaurus_dozen,aes(x=x,y=y,colour = dataset)) + geom_point() + theme_void() + theme(legend.position = "none") + facet_wrap(~dataset,ncol=3)