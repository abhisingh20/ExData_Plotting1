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
plot(df$dateTime, df$Global_active_power, ylab = "GlobalActive Power (Kilowatts)", xlab = "", type ="l")
dev.copy(png, "Plot2.png", height =480, width = 480)
dev.off()