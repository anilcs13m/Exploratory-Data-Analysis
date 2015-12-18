NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008
library(ggplot2)

# Searching for ON-ROAD type in NEI
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

emissions_by_year_type <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
emissions_by_year_type$fips[emissions_by_year_type$fips=="24510"]<-"Baltimore, MD"
emissions_by_year_type$fips[emissions_by_year_type$fips=="06037"]<-"Los Angeles, CA"

png("plot6.png", width=640, height=480)
g <- ggplot(emissions_by_year_type, aes(factor(year), Emissions, color = type))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City,
  			 MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()
