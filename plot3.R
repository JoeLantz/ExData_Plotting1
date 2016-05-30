##
# R Code to create the Plot 3
##
# Read in the power Consumption file; To get column names from data set Factors set strignAsFactors to false; header to true; sep = ";"
##
powerconsumption <- read.table("../data/household_power_consumption.txt",stringsAsFactors = FALSE, sep = ";", header = TRUE)
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
# Open the graphic device png
##
png(file= "plot3.png",width = 480, height = 480)
##
# x axis is the number of rows of data corresponding to the time interval; y axis is kilowatts; do not draw yet; do not print x-axis ticks 
##
plot(powerconsumptiondtss$datetime, powerconsumptiondtss$Sub_metering_1,
     ylab = "Energy sub metering",
     xlab = "",
     col  = "black",
     type = "l")
##
# Draw the x,y lines, type = "l"
##
points(powerconsumptiondtss$datetime, 
       powerconsumptiondtss$Sub_metering_2,
       lwd = 2, type="l", col = "red")
points(powerconsumptiondtss$datetime, 
       powerconsumptiondtss$Sub_metering_3, 
       lwd = 2, type="l",col = "blue")
##
# Draw the legend; Change the color back to "black" so the legend text is black
##
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

