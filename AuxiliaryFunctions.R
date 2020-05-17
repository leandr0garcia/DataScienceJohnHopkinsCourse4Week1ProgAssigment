library(data.table)

loadData <- function(path = "./data") {
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
    # path="./data"
    data_file <- paste(path, "household_power_consumption.txt", sep="/")
    print(data_file)
    print(paste("Loading file: ",data_file, sep="", collapse=""))
    data_df <- data.table::fread(file = data_file, header = TRUE, sep = ";", na.strings = "?") # Load the data in the data frame
    
    ## COMBINING DATE AND TIME
    data_df$FULL_DATE <- paste(as.character(data_df$Date), as.character(data_df$Time), sep = " ")
    data_df$FULL_DATE <- as.POSIXct(data_df$FULL_DATE, format="%d/%m/%Y %H:%M")
    data_df$Date <- as.Date(data_df$Date, format="%d/%m/%Y")
    # data_df$Time <- as.Date(data_df$Time, format = "%H:%M" )
    return(data_df)
}



savePlotToPNG <- function(Xresolution= 480, Yresolution = 480) {
  
}