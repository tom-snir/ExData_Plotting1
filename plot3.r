## reading the dataset from the working directory and formatting the Date variable

mydata <- read.csv("./household_power_consumption.txt", header = T, sep=';', na.strings="?",
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

## subsetting the relevant section of the data

data <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## date conversion

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## creating the third plot

with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## saving the third plot to a .png file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()