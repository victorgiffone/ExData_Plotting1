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
x <- paste(data$Date, data$Time)


x <- strptime(x,"%Y-%m-%d %H:%M:%S")



png(filename = "plot2.png", 480, 480)
with(data, plot(  x,Global_active_power,
                ylab = "Global Active Power (kilowatts)",
                type = "l",
                xlab = ""))

dev.off()




