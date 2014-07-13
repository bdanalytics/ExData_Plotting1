# Project1 for Exploratory Data Analysis Coursera Course
# Import and prepare data for creating plots for Electric Power Consumption data from 
#   the UC Irvine Machine Learning Repository
rm(list = ls())

# Assumes data file is present in a subdirectory called data 
# Inspect data file
#system("ls -alF data/")
#system("head data/household_power_consumption.txt")
# check missing values handling
#system("grep -n '?' data/household_power_consumption.txt | head")
#power_df <- read.table("data/household_power_consumption.txt", header=TRUE,
#                       sep=";", na.strings = "?", nrows=6850)
#tail(power_df,11)
# check that file has 2,075,259 obs (+1 header)
#system("wc -l data/household_power_consumption.txt")

# Construct data file subset containing dates 2007-02-01 to 02 
system("head -1 data/household_power_consumption.txt > data/household_power_consumption_2007_02_01_to_02.txt")
system("grep '^1/2/2007' data/household_power_consumption.txt >> data/household_power_consumption_2007_02_01_to_02.txt")
system("grep '^2/2/2007' data/household_power_consumption.txt >> data/household_power_consumption_2007_02_01_to_02.txt")
#system("head data/household_power_consumption_2007_02_01_to_02.txt")
#system("tail data/household_power_consumption_2007_02_01_to_02.txt")
#system("wc -l data/household_power_consumption_2007_02_01_to_02.txt")

# Read data subset file
power_raw_df <- read.table("data/household_power_consumption_2007_02_01_to_02.txt",
                           header=TRUE, sep=";", na.strings = "?")
#summary(power_raw_df)
#str(power_raw_df)

# Combine Date & Time into one POSIXlt variable: sample_pxt
power_raw_df$sample_pxt <- strptime(paste(power_raw_df$Date, power_raw_df$Time),
                                    format="%d/%m/%Y %H:%M:%S")
# Drop Date & Time columns
power_df <- subset(power_raw_df, select=-c(Date, Time))
str(power_df)

