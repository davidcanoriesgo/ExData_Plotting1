## Read the dataset:

dataset <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Convert date column to date class as suggested:

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

## Only necessary data will be loaded used as per instructions

dataset <- dataset[dataset$Date >= as.Date("2007-02-01") & dataset$Date <= as.Date("2007-02-02"),]

## Plot # 1: Global Active Power histogram

png("plot1.png", width=480, height=480)
par(mar=c(4.7, 4.7, 0.7, 0.7))
hist(dataset$Global_active_power, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off() ## Closing device
