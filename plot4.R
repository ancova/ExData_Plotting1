# set the session locale
sessionInfo()
Sys.setlocale("LC_TIME", "English")
# set working directory
setwd("K:\\MOOCs - Data Science Specialization\\4. Exploratory Data Analysis\\Course Projects\\Course Project 1")
# read in data
EPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
# subsetting data
Project1 <- EPC[EPC$Date=="1/2/2007"|EPC$Date=="2/2/2007",]
# covert the date and date time
Project1$DateTime <- strptime(paste(Project1$Date, Project1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Project1$Date <- as.Date(Project1$Date, format="%d/%m/%Y")
# data summary 
str(Project1)
summary(Project1)

# plot 4
png(file="plot4.png", width=480, height=480, units="px", bg="transparent")
par(mfcol=c(2,2))
with(Project1, {
	# 1st
	plot(DateTime, Global_active_power, type= "l", xlab = "", ylab= "Global Active Power")
	# 2nd
	plot(DateTime, Sub_metering_1, type= "n", xlab = "", ylab= "Energy sub metering")
	points(DateTime, Sub_metering_1, type = "l", col="black")
	points(DateTime, Sub_metering_2, type = "l", col="red")
	points(DateTime, Sub_metering_3, type = "l", col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2), col=c("black", "red", "blue"),bty="n" )
	# 3rd
	plot(DateTime, Voltage, type= "l", xlab = "datetime", ylab= "Voltage")
	# 4th
	plot(DateTime, Global_reactive_power, type= "l", xlab = "datetime", ylab= "Global_reactive_power")
})
dev.off()