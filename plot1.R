# Project1 for Exploratory Data Analysis Coursera Course
# Create plots for Electric Power Consumption data from 
#   the UC Irvine Machine Learning Repository
source("import_plot_data.R")

# Create plot
hist(power_df$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", height=480, width=480); dev.off()
