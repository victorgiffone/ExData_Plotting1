setwd("C:/Users/victor/Dropbox/TPR/tp4")

# step 1 : load and subset data
library(readr)
data <- read_delim("household_power_consumption.txt", 
                   ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                Time = col_time(format = "%H:%M:%S")), 
                   trim_ws = TRUE)

data <- subset(data, Date <= "2007-02-02")
data <- subset(data, Date >= "2007-02-01")

# step 2 plot data : 

setwd("C:/Users/victor/Dropbox/TPR/tp4/ExData_Plotting1")

# combine date and time data
x <- paste(data$Date, data$Time)


x <- strptime(x,"%Y-%m-%d %H:%M:%S")
data$x <- x

####ploting the data
png(filename = "plot4.png", 480, 480)

par(mfrow = c(2,2))

### graph 1
with(data, plot(  x,Global_active_power,
                  ylab = "Global Active Power (kilowatts)",
                  type = "l",
                  xlab = ""))

### graph 2
with(data, plot(  x, Voltage,
                  xlab = "datetime",
                  type = "l"))

### graph 3
with(data, plot(  x, Sub_metering_1,
                  ylab = "Energy sub metering",
                  type = "l",
                  xlab = "",
                  col = c("black")))
with(data,lines(x,Sub_metering_2,col = "red"))
with(data,lines(x,Sub_metering_3,col = "blue"))
legend("topright" ,lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty = "n")

### graph 4
with(data, plot(  x, Global_reactive_power,
                  xlab = "datetime",
                  type = "l"))

dev.off()