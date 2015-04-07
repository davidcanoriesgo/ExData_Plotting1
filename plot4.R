## Read the dataset:

dataset <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Convert date column to date class as suggested:

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

## Only necessary data will be loaded used as per instructions

dataset <- dataset[dataset$Date >= as.Date("2007-02-01") & dataset$Date <= as.Date("2007-02-02"),]

## Date variable should be merged with Time to be represented:

dataset$Date <- as.POSIXlt(paste(as.Date(dataset$Date, format="%d/%m/%Y"), dataset$Time, sep=" "))

## Plot # 4: Plotting multiple flames

png("plot4.png", width=480, height=480)
par(mar=c(4.7, 4.7, 0.7, 0.7), mfrow=c(2,2)) ## 2 by 2 plot created, by rows

## Plot # Row 1, column 1, similar to exercise plot2.R 

plot(dataset$Date, dataset$Global_active_power, type="l",xlab="", ylab="Global Active Power")

## Plot # Row 1, column 2

plot(dataset$Date, dataset$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Plot # Row 2, column 1, similar to exercise plot3.R

plot(dataset$Date, dataset$Sub_metering_1, type="n", lwd=1, ylim=c(0, max(c(dataset$Sub_metering_1, dataset$Sub_metering_2, dataset$Sub_metering_3))), xlab="", ylab="Energy sub metering")

lines(dataset$Date, dataset$Sub_metering_1, col="black")
lines(dataset$Date, dataset$Sub_metering_2, col="red")
lines(dataset$Date, dataset$Sub_metering_3, col="blue")

legend("topright", lwd=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       box.lwd=0)

## Plot # Row 2, column 2

plot(dataset$Date, dataset$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off() ## Closing device
