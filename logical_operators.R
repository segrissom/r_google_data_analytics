#air quality dataset logical operators
#You want to find observations (rows) in which conditions are both extremely sunny and windy. You define this as observations that have a Solar measurement of over 150 and a Wind measurement of over 10.  
airquality[,"Solar.R"] > 150 & airquality[,"Wind"]>10

#find rows where super sunny or super windy
#Note that the OR operator is | in R
airquality[,"Solar.R"] > 150 | airquality[,"Wind"] > 10

#just want weather conditions for day taht aren't the first of the month
airquality[, "Day"] != 1

#want to find days taht aren't extremely sunny or extremely windy
# note that the ! is at the beginning of the line
!airquality[,"Solar.R"] >150 | airquality[,"Wind"] > 10

#using if statements --> not much diff than python,but use {} to start and end
x <- 4
if (x>0){
	print("x is a positive number")
}
#another example of if statements. this one pulls specifically the first row from the temp column to see if it's less than 80
if(airquality[1, "Temp"] < 80){
print("it's not a hot day")
}
#if with an else statement - same type of logic as all other programming languages are
x <- 7
if (x > 0) {
  print ("x is a positive number")
} else {
  print ("x is either a negative number or zero")
}
#sample with the airquality --> note that the airquality thing is noted oddly
if (airquality$Temp[1] < 80) {
  print("It's not a hot day!")
} else {
  print("It's a hot day.")
}
#else if 
x <- -1
if (x < 0) {
  print("x is a negative number")
} else if (x == 0) {
  print("x is zero")
} else {
  print("x is a positive number")
}
#else if airwuality
ozone_level <- airquality[1,"Ozone"]
if(is.na(ozone_level)){
  print("Ozone reading is missing for the first day.")
} else if(ozone_level < 30){ 
  print("Low ozone level.")
} else if(ozone_level < 100){ 
  print("Moderate ozone level.")
} else{
  print("High ozone level.")
}

