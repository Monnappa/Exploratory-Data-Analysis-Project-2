# Assignment Question 2

# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

## Read files using readRDS() function
      NEI <- readRDS("summarySCC_PM25.rds")
      SCC <- readRDS("Source_Classification_Code.rds")

### Prepare Data for Plot 

      # Filter Baltimore Data from the above Data set
      
      dfBM <- subset(NEI, NEI$fips == "24510")
      
#Use aggregate function to find the sum of Emissions by Year for Baltimore City
        dfBM <- aggregate(dfBM[c("Emissions")], list(year = dfBM$year), sum)

# Plot the Emission Data Vs Year
  
      png('plot2.png', width=480, height=480)
      plot(dfBM$year, dfBM$Emissions, type = "l", 
           main = "Total Emissions from PM2.5 in Baltimore City",
           xlab = "Year", ylab = "Emissions")
      
      dev.off()