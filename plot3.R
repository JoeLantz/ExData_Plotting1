##
# R Code to create the Plot 3
##
# Read in the power Consumption file; To get column names from data set Factors set strignAsFactors to false; header to true; sep = ";"
##
powerconsumption <- read.table("../data/household_power_consumption.txt",stringsAsFactors = FALSE, sep = ";", header = TRUE)
##
# Convert to dplyr
##
library(dplyr)
dfpowerconsumption <- tbl_df(powerconsumption)
##
# Paste Date and Time together and reformat to POSIXct
##
datetime=strptime(paste(dfpowerconsumption$Date, dfpowerconsumption$Time), format = "%d/%m/%Y %H:%M:%S")
##
# Bind the datetime to left side of Power Consumption data.frame
##
dfpowerconsumptiondt <- cbind(datetime, dfpowerconsumption)
##
# Get rid of Date and Time variables
##
dfpowerconsumptiondt <- select( dfpowerconsumptiondt, -Date, -Time)
##
# Subset the data set for 2007/02/01 - 2007/02/03 00:00:00 so it includes the start of Saturday (used to get x-axis tick label)
##
dfpowerconsumptiondtss <- subset(dfpowerconsumptiondt, datetime >= "2007-02-01" & datetime <= "2007-02-03")
##
# Get the rows of data in the data set
##
i <- c(1:dim(dfpowerconsumptiondtss)[1])
##
# x axis is the number of rows of data corresponding to the time interval; y axis is kilowatts; do not draw yet; do not print x-axis ticks 
plot(i, dfpowerconsumptiondtss$Sub_metering_1, 
     ylab = "Energy sub metering",
     xlab = "",
     type = "n",
     xaxt = "n")
##
# Compute the location of tick mark labels by day starts at midnight
# 
tickmarklocation <- grep("00:00:00",dfpowerconsumptiondtss$datetime)
##
# On the x-axis, set the location of the tickmarks; Get 3 character label for tick mark that is day of week
##
axis(side = 1, at = tickmarklocation, 
               labels = substr(weekdays(dfpowerconsumptiondtss$datetime[grep("00:00:00", dfpowerconsumptiondtss$datetime)]), 1,3))
##
# Draw the x,y lines, type = "c"
##
lines(as.numeric(dfpowerconsumptiondtss$Sub_metering_1, 
                 dfpowerconsumptiondtss$Sub_metering_1,
                 lwd = 2, type="c", col = "black"))
par(col="red")
lines(as.numeric(dfpowerconsumptiondtss$Sub_metering_2, 
                 dfpowerconsumptiondtss$Sub_metering_2,
                 lwd = 2, type="c", col = "red"))
par(col="blue")
lines(as.numeric(dfpowerconsumptiondtss$Sub_metering_3, 
                 dfpowerconsumptiondtss$Sub_metering_3, 
                 lwd = 2, type="c",col = "blue"))
##
# Draw the legend; Change the color back to "black" so the legend text is black
##
par(col="black")
plotlegend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend=plotlegend,
       col=c("black", "red", "blue"), lty=1, cex=0.8)
##
# Open the graphic device png
##
png(file= "plot3.png")
##
# Plot to the png graphic device
##
plot(i, dfpowerconsumptiondtss$Sub_metering_1, 
     ylab = "Energy sub metering",
     xlab = "",
     type = "n",
     xaxt = "n")
tickmarklocation <- grep("00:00:00",dfpowerconsumptiondtss$datetime)
axis(side = 1, at = tickmarklocation, 
     labels = substr(weekdays(dfpowerconsumptiondtss$datetime[grep("00:00:00", dfpowerconsumptiondtss$datetime)]), 1,3))
lines(as.numeric(dfpowerconsumptiondtss$Sub_metering_1, 
                 dfpowerconsumptiondtss$Sub_metering_1,
                 lwd = 2, type="c", col = "black"))
par(col="red")
lines(as.numeric(dfpowerconsumptiondtss$Sub_metering_2, 
                 dfpowerconsumptiondtss$Sub_metering_2,
                 lwd = 2, type="c", col = "red"))
par(col="blue")
lines(as.numeric(dfpowerconsumptiondtss$Sub_metering_3, 
                 dfpowerconsumptiondtss$Sub_metering_3, 
                 lwd = 2, type="c",col = "blue"))
par(col="black")
plotlegend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend=plotlegend,
       col=c("black", "red", "blue"), lty=1, cex=0.8)
##
# Get the current device
##
currentdevice <- dev.cur()
##
# Close the graphic device
##
dev.off(currentdevice)
##
