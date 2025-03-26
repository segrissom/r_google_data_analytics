#exploring bias with R, by comparing actual outcome of data with predicted outcome

#if model is unbiased, the outcome based on the sim design package should be close to 0
#this package finds the average amount that the actual outcome is greater than the predicted outcome
#a higher result suggests data might be biased

#going to look at weather to see if it's biased
install.packages("SimDesign")
library(SimDesign)

#going to make some data for the actual temp
actual_temp <- c(68.3,70,72.4,71,67,70)

#then going to make predicted temps
predicted_temp <- c(67.9,69,71.5,70,67,69)

#now going to run the bias function
bias(actual_temp, predicted_temp)

#when run, we get a result of 0.71 - which is pretty close to zero, but the prediction was generally leaning lower
#and so the system is a little biased

#new scenario, working for a gamestore, going to compare the actual sales on release day to predicted
actual_sales <- c(150,203,137,247,116,287)
predicted_sales <- c(200,300,150,250,150,300)

bias(actual_sales,predicted_sales)
#got a result of -35 -> which suggests super biased
#the negative suggests that the predicted sales are OVER the actual


