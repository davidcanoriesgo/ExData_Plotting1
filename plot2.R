## Read the dataset:

dataset <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Convert date column to date class as suggested:

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

## Only necessary data will be loaded used as per instructions

dataset <- dataset[dataset$Date >= as.Date("2007-02-01") & dataset$Date <= as.Date("2007-02-02"),]

## Date variable should be merged with Time to be represented:

dataset$Date <- as.POSIXlt(paste(as.Date(dataset$Date, format="%d/%m/%Y"), dataset$Time, sep=" "))

## Plot # 2: Global Active Power  vs time

png("plot2.png", width=480, height=480)
par(mar=c(4.7, 4.7, 0.7, 0.7))
plot(dataset$Date, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off() ## Closing device