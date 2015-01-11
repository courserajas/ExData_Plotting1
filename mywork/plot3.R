# read the data file and using semicolon as a separator
data <- read.csv("household_power_consumption.txt", sep = ";")

# get relevant data of required days
d <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", c("Date", 
                                                               "Time", 
                                                               "Sub_metering_1",
                                                               "Sub_metering_2",
                                                               "Sub_metering_3")]

# add a column, which combines date and time in native R format
d$DateTime <- as.POSIXct(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S")

# open device to create png file. transparent background as in examles in github
png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")

# create the plot with first graph
plot(
  d$DateTime,
  as.numeric(as.character(d$Sub_metering_1)),
  main = NULL,
  xlab = "",
  ylab = "Energy sub metering",
  type = "l"
)

# add second graph
points(
  d$DateTime,
  as.numeric(as.character(d$Sub_metering_2)),
  type = "l",
  col = "red"
)

# add third graph
points(
  d$DateTime,
  as.numeric(as.character(d$Sub_metering_3)),
  type = "l",
  col = "blue"
)

# add a legend
legend("topright",
       lty = c(1,1),
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )

# close the graphics device
dev.off()