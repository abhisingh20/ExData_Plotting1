plot(df$dateTime, df$Global_active_power, ylab = "GlobalActive Power (Kilowatts)", xlab = "", type ="l")
dev.copy(png, "Plot2.png", height =480, width = 480)
dev.off()