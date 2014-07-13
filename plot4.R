# Project1 for Exploratory Data Analysis Coursera Course
# Create plots for Electric Power Consumption data from 
#   the UC Irvine Machine Learning Repository
source("import_plot_data.R")

# Create time series of metrics
power_ts <- ts(power_df,
               start=c(power_df[1, "sample_pxt"]$year,
                       power_df[1, "sample_pxt"]$mon,
                       power_df[1, "sample_pxt"]$mday,
                       power_df[1, "sample_pxt"]$hour,
                       power_df[1, "sample_pxt"]$min))

# Create plot
par(mfrow=c(2, 2))
source("draw_xaxis_ticks.R")

## Plot [1, 1]
par(xaxt="n")
plot.ts(power_ts[, "Global_active_power"], 
        ylab="Global Active Power", xlab=NULL, cex.lab=0.5, cex.axis=0.8)
draw_xaxis_ticks(power_df)

## Plot [1, 2]
par(xaxt="n")
plot.ts(power_ts[, "Voltage"], 
        ylab="Voltage", xlab="datetime", cex.lab=0.5, cex.axis=0.8)
draw_xaxis_ticks(power_df)

## Plot [2, 1]
par(xaxt="n")
plot.ts(power_ts[, c("Sub_metering_1", "Sub_metering_2",
                     "Sub_metering_3")], 
        ylab="Energy sub metering", xlab=NULL, plot.type="single",
        col=c("black", "red", "blue"), cex.lab=0.5, cex.axis=0.8)
draw_xaxis_ticks(power_df)
legend("topright", grep("^Sub_", attr(power_ts, "dimnames")[[2]], value=TRUE),
       lty=1, col=c("black", "red", "blue"), cex=0.6, bty="n")

## Plot [2, 2]
par(xaxt="n")
plot.ts(power_ts[, "Global_reactive_power"], 
        ylab="Global_reactive_power", xlab="datetime",
        cex.lab=0.5, cex.axis=0.8)
draw_xaxis_ticks(power_df)

dev.copy(png, file = "plot4.png", height=480, width=480); dev.off()
