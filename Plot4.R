df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Format date to Type Date and filtering date
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- subset(df,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))


## Remove incomplete observation
df <- df[complete.cases(df),]

## Combine Date and Time column and naming
dateTime <- paste(df$Date, df$Time)
dateTime <- setNames(dateTime, "DateTime")


## Add DateTime column and dropping Date and Time colmns
df <- cbind(dateTime, df)
df <- df[ ,!(names(df) %in% c("Date","Time"))]

## Format dateTime Column
df$dateTime <- as.POSIXct(dateTime) 

#Plotting
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png, "Plot4.png", width=480, heigh=480)
dev.off()