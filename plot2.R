##
# R Code to create the Plot 2
##
# Read in the power Consumption file; To get column names from data set Factors set strignAsFactors to false; header to true; sep = ";"
##
powerconsumption <- read.table("../data/household_power_consumption.txt",stringsAsFactors = FALSE, sep = ";", header = TRUE)
##
# Convert to dplyr
##
library(dplyr)
powerconsumption <- tbl_df(powerconsumption)
##
# Paste Date and Time together and reformat to POSIXct
# Input format is "%d/%m/%Y %H:%M:%S"
##
datetime <- strptime(paste(powerconsumption$Date, powerconsumption$Time), format = "%d/%m/%Y %H:%M:%S")
##
# Bind the datetime to left side of Power Consumption data.frame
##
powerconsumptiondt <- cbind(datetime, powerconsumption)
##
# Subset the data set for "2007-02-01" - "2007-02-03" 00:00:00 so it includes the start of Saturday (used to get x-axis tick label)
##
powerconsumptiondtss <- subset(powerconsumptiondt, datetime >= "2007-02-01" & datetime <= "2007-02-03")
##
# Open the graphic device png
##
png(file= "plot2.png",width = 480, height = 480)
##
# x axis is the number of rows of data corresponding to the time interval; y axis is kilowatts; do not draw yet; do not print x-axis ticks 
#
plot(powerconsumptiondtss$datetime, powerconsumptiondtss$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type="l", 
     xaxt = "n")
##
# On the x-axis, set the location of the tickmarks; Get 3 character label for tick mark that is day of week
# This plot explicitly formats and plots the x-axis tick mark labels
##
axis(side = 1, at = powerconsumptiondtss$datetime[grep("00:00:00", powerconsumptiondtss$datetime)], 
               labels = substr(weekdays(powerconsumptiondtss$datetime[grep("00:00:00", powerconsumptiondtss$datetime)]), 1,3))
##
# Get the current device
##
currentdevice <- dev.cur()
##
# Close the graphic device
##
dev.off(currentdevice)
##
