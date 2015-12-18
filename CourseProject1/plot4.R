
## loding data
data <- read.csv("household_power_consumption.txt",
                      header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F,
                      stringsAsFactors=F, comment.char="",
                      quote='\"')
## date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data by using date 
newData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
datetime <- paste(as.Date(newData$Date), newData$Time)
newData$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(newData$Global_active_power, main="Global Active Power", 
                               xlab="Global Active Power (kilowatts)",
                               ylab="Frequency",
                               col="Red")


dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()



## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(newData, {
                plot(Global_active_power~Datetime, type="l", 
                                                   ylab="Global Active Power (kilowatts)", 
                                                   xlab="")
                plot(Voltage~Datetime, type="l", 
                                       ylab="Voltage (volt)", 
                                       xlab="")

                plot(Sub_metering_1~Datetime, type="l", 
                                              ylab="Global Active Power (kilowatts)", 
                                              xlab="")

                lines(Sub_metering_2~Datetime,col='Red')
                lines(Sub_metering_3~Datetime,col='Blue')
                
                legend("topright", col=c("black", "red", "blue"), 
                                   lty=1, lwd=2, bty="n",
                                   legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

                plot(Global_reactive_power~Datetime, type="l", 
                                                     ylab="Global Rective Power (kilowatts)",
                                                     xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
