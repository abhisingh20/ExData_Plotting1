hist(df$Global_active_power, xlab = "Global Active Powers (Kilowatts)", main="Global Active Power", col = "red")
dev.copy(png, "Plot1.png", width =480, height=480)
dev.off()