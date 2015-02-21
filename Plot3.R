# Assignment Question 3

#Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, which of 
#these four sources have seen decreases in emissions 
#from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question. 

#Read ggplot2 Library

      library(ggplot2)

## Read files using readRDS() function
      NEI <- readRDS("summarySCC_PM25.rds")
      SCC <- readRDS("Source_Classification_Code.rds")

### Prepare Data for Plot 

  # Filter Baltimore Data from the above Data set
      
      dfBM <- subset(NEI, NEI$fips == "24510")
      
# Use aggregate function to find the sum of Emissions by Year 
# & Type for Baltimore City
        
      dfBM_sum <- aggregate(dfBM[c("Emissions")], list(type = dfBM$type, year = dfBM$year), sum)
      
# Plot the Emission Data Vs Year
     png('plot8.png', width=480, height=480)
     
   p <- ggplot(dfBM_sum, aes(x=year, y=Emissions, colour=type)) +
        geom_line() +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions in Baltimore City from 1999 to 2008')
      
   print(p)
      
   dev.off()