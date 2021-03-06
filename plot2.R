
# Set the working directory to where the Electric Power Consumption dataset was unzipped
setwd("C:/Users/jopapa/Documents/Coursera/") 

# Set the location of household power consumption file based upon the working directory
file_location <- paste(getwd(),"/household_power_consumption.txt",sep="")

# Load the household power consumption data
household_power_consumption <- read.table(file_location, sep=";", header=TRUE)

# Convert the Date and Time variables to Date/Time classes in R
household_power_consumption$Date <- as.Date(household_power_consumption$Date,format='%d/%m/%Y')
household_power_consumption$DateTime <- paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$DateTime <- strptime(household_power_consumption$DateTime, "%Y-%m-%d %H:%M:%S")

# Convert factors to numeric variables
household_power_consumption$Global_active_power   <- as.numeric(as.character(household_power_consumption$Global_active_power))
household_power_consumption$Global_reactive_power <- as.numeric(as.character(household_power_consumption$Global_reactive_power))
household_power_consumption$Voltage               <- as.numeric(as.character(household_power_consumption$Voltage))
household_power_consumption$Global_intensity      <- as.numeric(as.character(household_power_consumption$Global_intensity))
household_power_consumption$Sub_metering_1        <- as.numeric(as.character(household_power_consumption$Sub_metering_1))
household_power_consumption$Sub_metering_2        <- as.numeric(as.character(household_power_consumption$Sub_metering_2))
household_power_consumption$Sub_metering_3        <- as.numeric(as.character(household_power_consumption$Sub_metering_3))

# Subset data from the dates 2007-02-01 and 2007-02-02
household_power_consumption_subset <- subset(household_power_consumption, Date=="2007-02-01" | Date=="2007-02-02")

# Make Plot 2
plot(household_power_consumption_subset$DateTime, household_power_consumption_subset$Global_active_power, pch=".", xlab="", ylab="Global Active Power (kilowatts)")
lines(household_power_consumption_subset$DateTime, household_power_consumption_subset$Global_active_power)
dev.copy(png,'plot2.png',width = 480, height = 480)
dev.off()
