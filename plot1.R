# Load necessary libraries
library(data.table)

#unzip("C:\\Users\\PD\\Downloads\\exdata_data_household_power_consumption.zip", exdir ="C:\\Users\\U2ODCF\\Downloads\\exdata_data_household_power_consumption" )
# Read the data
electro_data <- fread("C:\\Users\\PD\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt", na.strings="?",sep = ";")

# Filter the data for specified dates
electro_data <- electro_data[Date %in% c("1/2/2007", "2/2/2007")]

# Convert Date and Time to DateTime
electro_data[, DateTime := as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]
# Plot 1: Global Active Power over time
png("plot1.png", width=480, height=480)
hist(electro_data$Global_active_power, main = " Global Active Power", col = "red", xlab = "Global Active Power (Kilowatts)" )
dev.off()
