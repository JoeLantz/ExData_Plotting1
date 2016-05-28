##
# R Code to create the Plot 4
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
# Set up to plot 4 graphs, column first
##
#par(mfrow = c(1,3), mar = c(4,4,2,1), oma = c(0,0,2,0))
par(mfcol = c(2,2))

##
# Get the rows of data in the data set
##
i <- c(1:dim(dfpowerconsumptiondtss)[1])
tickmarklocation <- grep("00:00:00",dfpowerconsumptiondtss$datetime)
##
#######################################################################
# Plot  "Global Sub Active Power" vs "Time" 
#######################################################################
##
plot(i, as.numeric(dfpowerconsumptiondtss$Global_active_power), 
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type="n", xaxt = "n")
axis(side = 1, at = tickmarklocation, 
     labels = substr(weekdays(dfpowerconsumptiondtss$datetime[grep("00:00:00", dfpowerconsumptiondtss$datetime)]), 1,3))
lines(as.numeric(dfpowerconsumptiondtss$Global_active_power, 
                 as.numeric(dfpowerconsumptiondtss$Global_active_power),lwd =2, type="c")) 
##
#######################################################################
# Plot "Energy Sub metering" vs "Time" 
#######################################################################
##
plot(i, dfpowerconsumptiondtss$Sub_metering_1, 
     ylab = "Energy sub metering",
     xlab = "",
     type = "n",
     xaxt = "n")
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
#######################################################################
# Plot "Voltage" vs "Time" 
#######################################################################
##
plot(i, as.numeric(dfpowerconsumptiondtss$Voltage), 
     ylab = "Voltage",
     xlab = "datetime",
     type="n", xaxt = "n")
axis(side = 1, at = tickmarklocation, 
     labels = substr(weekdays(dfpowerconsumptiondtss$datetime[grep("00:00:00", dfpowerconsumptiondtss$datetime)]), 1,3))
lines(as.numeric(dfpowerconsumptiondtss$Voltage, 
                 as.numeric(dfpowerconsumptiondtss$Voltage),lwd =2, type="c")) 
##
#######################################################################
# Plot "Global_reactive_power" vs "Time" 
#######################################################################
##
plot(i, as.numeric(dfpowerconsumptiondtss$Global_reactive_power), 
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type="n", xaxt = "n")
axis(side = 1, at = tickmarklocation, 
     labels = substr(weekdays(dfpowerconsumptiondtss$datetime[grep("00:00:00", dfpowerconsumptiondtss$datetime)]), 1,3))
lines(as.numeric(dfpowerconsumptiondtss$Global_reactive_power, 
                 as.numeric(dfpowerconsumptiondtss$Global_reactive_power),lwd =2, type="c")) 
##
# Open the graphic device png
##
png(file= "plot4.png")
##
# Plot to the png graphic device
##
##
# Set up to plot 4 graphs, column first
##
#par(mfrow = c(1,3), mar = c(4,4,2,1), oma = c(0,0,2,0))
par(mfcol = c(2,2))

##
# Get the rows of data in the data set
##
i <- c(1:dim(dfpowerconsumptiondtss)[1])
tickmarklocation <- grep("00:00:00",dfpowerconsumptiondtss$datetime)
##
#######################################################################
# Plot  "Global Sub Active Power" vs "Time" 
#######################################################################
##
plot(i, as.numeric(dfpowerconsumptiondtss$Global_active_power), 
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type="n", xaxt = "n")
axis(side = 1, at = tickmarklocation, 
     labels = substr(weekdays(dfpowerconsumptiondtss$datetime[grep("00:00:00", dfpowerconsumptiondtss$datetime)]), 1,3))
lines(as.numeric(dfpowerconsumptiondtss$Global_active_power, 
                 as.numeric(dfpowerconsumptiondtss$Global_active_power),lwd =2, type="c")) 
##
#######################################################################
# Plot "Energy Sub metering" vs "Time" 
#######################################################################
##
plot(i, dfpowerconsumptiondtss$Sub_metering_1, 
     ylab = "Energy sub metering",
     xlab = "",
     type = "n",
     xaxt = "n")
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
#######################################################################
# Plot "Voltage" vs "Time" 
#######################################################################
##
plot(i, as.numeric(dfpowerconsumptiondtss$Voltage), 
     ylab = "Voltage",
     xlab = "datetime",
     type="n", xaxt = "n")
axis(side = 1, at = tickmarklocation, 
     labels = substr(weekdays(dfpowerconsumptiondtss$datetime[grep("00:00:00", dfpowerconsumptiondtss$datetime)]), 1,3))
lines(as.numeric(dfpowerconsumptiondtss$Voltage, 
                 as.numeric(dfpowerconsumptiondtss$Voltage),lwd =2, type="c")) 
##
#######################################################################
# Plot "Global_reactive_power" vs "Time" 
#######################################################################
##
plot(i, as.numeric(dfpowerconsumptiondtss$Global_reactive_power), 
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type="n", xaxt = "n")
axis(side = 1, at = tickmarklocation, 
     labels = substr(weekdays(dfpowerconsumptiondtss$datetime[grep("00:00:00", dfpowerconsumptiondtss$datetime)]), 1,3))
lines(as.numeric(dfpowerconsumptiondtss$Global_reactive_power, 
                 as.numeric(dfpowerconsumptiondtss$Global_reactive_power),lwd =2, type="c")) 
##
# Get the current device
##
currentdevice <- dev.cur()
##
# Close the graphic device
##
dev.off(currentdevice)
##
