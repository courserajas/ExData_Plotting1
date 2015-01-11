# read the data file and using semicolon as a separator
data <- read.csv("household_power_consumption.txt", sep = ";")

# get relevant data of required days
d <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", c("Date", 
                                                               "Time",
                                                               "Global_active_power",
                                                               "Global_reactive_power",
                                                               "Voltage",
                                                               "Sub_metering_1",
                                                               "Sub_metering_2",
                                                               "Sub_metering_3")]

# add a column, which combines date and time in native R format
d$DateTime <- as.POSIXct(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S")

# open device to create png file. transparent background as in examles in github
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")

# define grid to hold plots
par(mfrow = c(2,2))
with(d, {
  
  # first plot
  plot(
    DateTime,
    as.numeric(as.character(Global_active_power)),
    main = NULL,
    xlab = "",
    ylab = "Global Active Power",
    type = "l"
  )
  
  # second plot
  plot(
    DateTime,
    as.numeric(as.character(Voltage)),
    main = NULL,
    xlab = "datetime",
    ylab = "Voltage",
    type = "l"
  )
  
  # third plot with first line drawn
  plot(
    d$DateTime,
    as.numeric(as.character(d$Sub_metering_1)),
    main = NULL,
    xlab = "",
    ylab = "Energy sub metering",
    type = "l"
  )
  
  # second line to third plot
  points(
    d$DateTime,
    as.numeric(as.character(d$Sub_metering_2)),
    type = "l",
    col = "red"
  )
  
  # third line to third plot
  points(
    d$DateTime,
    as.numeric(as.character(d$Sub_metering_3)),
    type = "l",
    col = "blue"
  )
  
  # add a legend to third plot
  legend("topright",
         lty = c(1,1),
         bty = "n",
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  )
  
  # fourth plot
  plot(
    DateTime,
    as.numeric(as.character(Global_reactive_power)),
    main = NULL,
    xlab = "datetime",
    ylab = "Global_reactive_power",
    type = "l"
  )
})

# close the graphics device
dev.off()