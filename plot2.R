# Project1 for Exploratory Data Analysis Coursera Course
# Create plots for Electric Power Consumption data from 
#   the UC Irvine Machine Learning Repository
source("import_plot_data.R")

# Create time series of Global active power
gapower_ts <- ts(power_df$Global_active_power,
                 start=c(power_df[1, "sample_pxt"]$year,
                         power_df[1, "sample_pxt"]$mon,
                         power_df[1, "sample_pxt"]$mday,
                         power_df[1, "sample_pxt"]$hour,
                         power_df[1, "sample_pxt"]$min))

# Create plot
par(xaxt="n")
plot.ts(gapower_ts, ylab="Global Active Power (kilowatts)", xlab=NULL)
source("draw_xaxis_ticks.R"); draw_xaxis_ticks(power_df)
dev.copy(png, file = "plot2.png", height=480, width=480); dev.off()
