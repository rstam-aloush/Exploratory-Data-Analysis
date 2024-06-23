# Load necessary libraries
library(data.table)

# Read the data
electro_data <- fread("C:\\Users\\PD\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt", na.strings="?",sep = ";")

# Filter the data for specified dates
electro_data <- electro_data[Date %in% c("1/2/2007", "2/2/2007")]

# Convert Date and Time to DateTime
electro_data[, DateTime := as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]

png("plot2.png", width=480, height=480)
plot(electro_data$DateTime, electro_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#plot(electro_data$DateTime, electro_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
dev.off()
