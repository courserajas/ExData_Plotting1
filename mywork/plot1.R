# read the data file and using semicolon as a separator
data <- read.csv("household_power_consumption.txt", sep = ";")

# get "Global Active Power" data of required days
d <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", 3]

# open device to create png file. transparent background as in examples in github
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")

# create the histogram with appropriate style
hist(as.numeric(as.character(d)), 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
