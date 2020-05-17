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
# print(object.size(data_df), units = "MB", standard = "legacy")

## BUILDING A NEW DEVICE
dev.new(din=c(480, 480)) # avoiding the R studio plot viewer.
this_device <- dev.cur()

## PLOTTING
# OPTIONAL: png(filename = "plot1.png", width = 480, height = 480)
plot_data <- subset(data_df, select=c(Global_active_power), subset = (Date>='2007-02-01' & Date <='2007-02-02')) 
hist(x = plot_data[["Global_active_power"]] , xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power (Frequency - Hist)", col = "red", fre = TRUE)

## FINAL STEPS ... COPYING THE PLOTS AND CLOSING THE DEVICES
png_device <- dev.copy(device = png, filename = "plot1.png")
dev.off(which = png_device)
dev.off(which = this_device)