## reading the dataset from the working directory and formatting the Date variable

mydata <- read.csv("./household_power_consumption.txt", header = T, sep=';', na.strings="?",
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

## subsetting the relevant section of the data

data <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## date conversion

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## creating the second plot

plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## saving the second plot to a .png file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()