# Laden der notwendigen Bibliotheken
library(data.table)

# Lesen der Daten
electro_data <- fread("household_power_consumption.txt", na.strings="?", sep=";")

# Filtern der Daten für die angegebenen Daten
electro_data <- electro_data[Date %in% c("1/2/2007", "2/2/2007")]

# Konvertieren von Date und Time in DateTime
electro_data[, DateTime := as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]

# Erstellen von Plots auf einer Seite
png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2))

# Plot 1: Global Active Power over time
plot(electro_data$DateTime, electro_data$Global_active_power, type="l",xaxt = "n", xlab="", ylab="Global Active Power (kilowatts)")
# Plot 2: Voltage over time
plot(electro_data$DateTime, electro_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3: Energy sub-metering
plot(electro_data$DateTime, electro_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(electro_data$DateTime, electro_data$Sub_metering_2, col="red")
lines(electro_data$DateTime, electro_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

# Plot 4: Global Reactive Power over time
plot(electro_data$DateTime, electro_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()
