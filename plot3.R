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


png(filename = "plot3.png", 480, 480)
with(data, plot(  x, Sub_metering_1,
                  ylab = "Energy sub metering",
                  type = "l",
                  xlab = "",
                  col = c("black")))
with(data,lines(x,Sub_metering_2,col = "red"))
with(data,lines(x,Sub_metering_3,col = "blue"))
legend(legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(data, plot(  x, Sub_metering_1)
dev.off()




library(ggplot2)

test <- ggplot(data, aes( x = data$Time, y = Sub_metering_1 + Sub_metering_2)) + geom_line()
      ggplot(data, aes( x = data$Time, y = Sub_metering_2))
test

with(data, plot(  x, Sub_metering_2,
                  ylab = "Energy sub metering",
                  type = "l",
                  xlab = "",
                  add = TRUE))
