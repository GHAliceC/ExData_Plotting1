rm(list = ls())
setwd("./Documents/R_programming/")

## Read the txt file and seperate the values by ";"
house_data <- read.table("./household_power_consumption.txt",
                         header = TRUE, stringsAsFactors = FALSE, sep = ";")

## Subset data from dates 2007-02-01 and 2007-02-02
Sub_data <- house_data[house_data$Date %in% c("1/2/2007", "2/2/2007"), ]

## Data preparation for selected columns
gap <- as.numeric(Sub_data$Global_active_power)
voltage <- as.numeric(Sub_data$Voltage)
grp <- as.numeric(Sub_data$Global_reactive_power)
sub_m1 <- as.numeric(Sub_data$Sub_metering_1)
sub_m2 <- as.numeric(Sub_data$Sub_metering_2)
sub_m3 <- as.numeric(Sub_data$Sub_metering_3)
Date_Time <- paste(Sub_data$Date, Sub_data$Time)
datetime <- strptime(Date_Time,format = "%d/%m/%Y%H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

## Top-left
plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power")
## Topright
plot(datetime, voltage, type = "l", ylab = "Voltage")
## Bottom-left
plot(datetime, sub_m1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(datetime, sub_m2, type = "l", col = "red")
lines(datetime, sub_m3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), bty = "n")
## Bottom-right
plot(datetime, grp, type = "l", ylab = "Global_reactive_power")

dev.off()