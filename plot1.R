rm(list = ls())
setwd("./Documents/R_programming/")

## Read the txt file and seperate the values by ";"
house_data <- read.table("./household_power_consumption.txt",
                         header = TRUE, stringsAsFactors = FALSE, sep = ";")

## Subset data from dates 2007-02-01 and 2007-02-02
Sub_data <- house_data[house_data$Date %in% c("1/2/2007", "2/2/2007"), ]

## Create the first plot and save as a png file
gap <- as.numeric(Sub_data$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(gap, xlab = "Global Active Power(kilowatts)", col = "red", main = "Global Active Power")
dev.off()

