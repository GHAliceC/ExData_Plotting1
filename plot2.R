rm(list = ls())
setwd("./Documents/R_programming/")

## Read the txt file and seperate the values by ";"
house_data <- read.table("./household_power_consumption.txt",
                         header = TRUE, stringsAsFactors = FALSE, sep = ";")

## Subset data from dates 2007-02-01 and 2007-02-02
Sub_data <- house_data[house_data$Date %in% c("1/2/2007", "2/2/2007"), ]

## Create the second plot and save as a png file
gap <- as.numeric(Sub_data$Global_active_power)
Date_Time <- paste(Sub_data$Date, Sub_data$Time)
datetime <- strptime(Date_Time,format = "%d/%m/%Y%H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()
       
       