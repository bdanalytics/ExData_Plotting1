# Project1 for Exploratory Data Analysis Coursera Course
# Create plots for Electric Power Consumption data from 
#   the UC Irvine Machine Learning Repository
source("import_plot_data.R")

# Create time series of metrics
power_ts <- ts(power_df[, c("Sub_metering_1", "Sub_metering_2",
                            "Sub_metering_3")],
                 start=c(power_df[1, "sample_pxt"]$year,
                         power_df[1, "sample_pxt"]$mon,
                         power_df[1, "sample_pxt"]$mday,
                         power_df[1, "sample_pxt"]$hour,
                         power_df[1, "sample_pxt"]$min))

# Create plot
par(xaxt="n")
plot.ts(power_ts, ylab="Energy sub metering", xlab=NULL, plot.type="single",
        col=c("black", "red", "blue"))
source("draw_xaxis_ticks.R"); draw_xaxis_ticks(power_df)
legend("topright", attr(power_ts, "dimnames")[[2]], lty=1,
       col=c("black", "red", "blue"))
dev.copy(png, file = "plot3.png", height=480, width=480); dev.off()
