# Assignment Question 5

# 5. How have emissions from motor vehicle sources 
#    changed from 1999-2008 in Baltimore City?

#Read ggplot2 Library

      library(ggplot2)

## Read files using readRDS() function
      NEI <- readRDS("summarySCC_PM25.rds")
      SCC <- readRDS("Source_Classification_Code.rds")
      
# Subset SCC Data using above Data
      # Extract Vehicle Data from SCC
      SCC.VEH <- subset(SCC, grepl("Vehicle", EI.Sector))
      
      
      # Subset NEI Data using SCC # for Vehicles
      NEI.VEH <- subset(NEI, NEI$SCC %in%  SCC.VEH$SCC)
 
# Subset above NEI Data for Baltimore City
      
      BC <- subset(NEI.VEH, fips == "24510")
    
# Use aggregate function to find the sum of Emissions by Vehicle 
# & Type for Baltimore City
        
      SUM.BC <- aggregate(BC[c("Emissions")], list(year = BC$year), sum)
      
# Plot the Emission Data Vs Year
      library(ggplot2)
      png('plot5A.png', width=480, height=480)
      plot(SUM.BC$year, SUM.BC$Emissions, type = "l", 
           main = "Total Vehicle Emissions in Baltimore City",
           xlab = "Year", ylab = "Emissions")
      
      dev.off()