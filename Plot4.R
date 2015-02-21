# Assignment Question 4

#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999-2008? 

#Read ggplot2 Library

      library(ggplot2)

## Read files using readRDS() function
      NEI <- readRDS("summarySCC_PM25.rds")
      SCC <- readRDS("Source_Classification_Code.rds")

### Prepare Data for Plot 

  # Filter all EI.Sector Names with "Coal-Combustion" Related strings from the SCC Data set
      CC <- grep("coal",SCC$EI.Sector,value=T,ignore.case=T)
  
  # Extract SCC code for the above Use the above SCC codes to Subset NEI Data
    scc.cc <- subset(SCC, grepl("[Cc]oal",EI.Sector))
      
      
  # Extract Dataset from NEI matching with SCC.CC Dataset 
      NEI.CC <- subset(NEI, NEI$SCC %in%  scc.cc$SCC)
    
      
# Use aggregate function to find the sum of Emissions by Year 
# & Type for Baltimore City
        
      SUM_NEI.CC <- aggregate(NEI.CC[c("Emissions")], list(year = NEI.CC$year), sum)
      
# Plot the Emission Data Vs Year
     png('plot4.png', width=480, height=480)
     
   p <- ggplot(SUM_NEI.CC, aes(x=year, y=Emissions)) +
        geom_point() +
        geom_smooth() +
        ggtitle("Total PM2.5 Coal Combustion Emissions in the US")
      
      print(p)
      
      dev.off()