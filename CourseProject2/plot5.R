NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008
library(ggplot2)

# Searching for ON-ROAD type in NEI
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]



emissions_by_year_type <- aggregate(Emissions ~ year + type, subsetNEI, sum)
png("plot5.png", width=640, height=480)
g <- ggplot(emissions_by_year_type, aes(factor(year), Emissions, color = type))
g <- g + geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + 
		 ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')

print(g)
dev.off()