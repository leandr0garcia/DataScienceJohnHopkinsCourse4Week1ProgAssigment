source("AuxiliaryFunctions.R")

data_df <- loadData()
## Data Frame columns 
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

## SETTING ENGLISH TO GET DAYS IN ENGLISH
Sys.setlocale("LC_TIME", "English")

## BUILDING A NEW DEVICE
dev.new(din=c(480, 480)) # avoiding the R studio plot viewer.
this_device <- dev.cur()

## Setting the canvas to 2x2 = 4 plots
par(mfrow=c(2, 2))

## Selecting the data to plot
plot_data <- subset(data_df, select=c(Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3, FULL_DATE), subset = (Date>='2007-02-01' & Date <='2007-02-02')) 

## PLOTTING GRAPH[1, 1]
plot(type="l", x = plot_data$FULL_DATE, y = plot_data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", col = "black")

## PLOTTING GRAPH[1, 2]
plot(type="l", x = plot_data$FULL_DATE, y = plot_data$Voltage, ylab = "Voltage", col = "black")


## PLOTTING GRAPH[2, 1]
# lines(x=data_df$Date, y=data_df$Global_active_power) 
plot(type="l", x = plot_data$FULL_DATE, y = plot_data$Sub_metering_1, xlab = "", ylab = "Energy Sub metering",  col = "black")
points(type="l", x = plot_data$FULL_DATE, y = plot_data$Sub_metering_2, col = "red")
points(type="l", x = plot_data$FULL_DATE, y = plot_data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## PLOTTING GRAPH[2, 2]
plot(type="l", x = plot_data$FULL_DATE, y = plot_data$Global_reactive_power, ylab = "Global_reactive_power", col = "black")

## FINAL STEPS ... COPYING THE PLOTS AND CLOSING THE DEVICES
png_device <- dev.copy(device = png, filename = "plot4.png")
dev.off(which = png_device)
dev.off(which = this_device)
dev.list()
