# Assignment Question 1

# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, # make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Read files using readRDS() function
      NEI <- readRDS("summarySCC_PM25.rds")
      SCC <- readRDS("Source_Classification_Code.rds")

### Prepare Data for Plot 
#Use aggregate function to find the sum of Emissions by Year
      
        df <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

# Plot the Emission Data Vs Year
  
      png('plot1.png', width=480, height=480)
      plot(df$year, df$Emissions, type = "l", 
           main = "Total Emissions from PM2.5 in the US",
           xlab = "Year", ylab = "Emissions")
      
      dev.off()