# read the data file and using semicolon as a separator
data <- read.csv("household_power_consumption.txt", sep = ";")

# get "Global Active Power" data of required days
d <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", c("Date", "Time", "Global_active_power")]

# add a column, which combines date and time in native R format
d$DateTime <- as.POSIXct(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S")

# open device to create png file. transparent background as in examples in github
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")

# create the plot with appropriate style
plot(
  d$DateTime,
  as.numeric(as.character(d$Global_active_power)),
  main = NULL,
  xlab = "",
  ylab = "Global Active Power (kilowatts)",
  type = "l"
  )

# close the graphics device
dev.off()
