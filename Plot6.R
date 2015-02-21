# Assignment Question 6

# 6. Compare emissions from motor vehicle sources in Baltimore City 
     #with emissions from motor vehicle sources in Los Angeles County, 
     #California (fips == "06037"). Which city has seen greater changes 
     #over time in motor vehicle emissions?


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
 
# Subset above NEI Data for Baltimore City & LA
      
      BC.LA <- subset(NEI.VEH, fips == "24510"|fips == "06037")
    
# Use aggregate function to find the sum of Emissions by Vehicle 
# & Type for Baltimore City
        
      SUM.BCLA <- aggregate(BC.LA[c("Emissions")], list(fips = BC.LA$fips, year = BC.LA$year), sum)
      
      # Add a new column to include name of the City
      SUM.BCLA$city <- rep(NA, nrow(SUM.BCLA))
      
      #  Add City/County Names based on fips number
      SUM.BCLA[SUM.BCLA$fips == "06037", ][, "city"] <- "Los Angles County"
      SUM.BCLA[SUM.BCLA$fips == "24510", ][, "city"] <- "Baltimore City"
      
# Plot the Emission Data Vs Year
      #  Create Plot
      library(ggplot2)
      png('plot6.png', width=480, height=480)
      p <- ggplot(SUM.BCLA, aes(x=year, y=Emissions, colour=city)) +
        geom_point(alpha=.3) +
        geom_smooth(alpha=.2, size=1, method="loess") +
        ggtitle("Vehicle Emissions in Baltimore vs. LA")
      
      print(p)
      
      
      dev.off()