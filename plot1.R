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
png()
with(data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))