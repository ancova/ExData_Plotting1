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

# plot 2
png(file="plot2.png", width=480, height=480, units="px", bg="transparent")
plot(Project1$DateTime, Project1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# chinese weekdays??
dev.off()