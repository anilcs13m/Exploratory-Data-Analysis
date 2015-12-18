
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

## Plot 2
plot(newData$Global_active_power~newData$Datetime, 
											type="l",
 										    ylab="Global Active Power (kilowatts)", 
 										    xlab="")

dev.copy(png, file="plot2.png", 
			  height=480, 
			  width=480)
dev.off()
