##
# R Code to create the 'Global Active Power' Plot 1 
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
# Subset the data set for 2007/02/01 to the first measurement on Feb 3,  2007/02/03
##
dfpowerconsumptiondtss <- subset(dfpowerconsumptiondt, datetime >= "2007-02-01" & datetime <= "2007-02-03")
##
# Plot the histogram to screen
##
hist(as.numeric(dfpowerconsumptiondtss$Global_active_power), main ="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")
##
# Open the graphic device png
##
png(file= "plot1.png")
##
# Plot to the png graphic device
##
hist(as.numeric(dfpowerconsumptiondtss$Global_active_power), main ="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")
##
# Get the current device
##
currentdevice <- dev.cur()
##
# Close the graphic device
##
dev.off(currentdevice)
##