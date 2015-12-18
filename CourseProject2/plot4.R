NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by="SCC") 																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(ggplot2)

coalMatches <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)


emissions_by_year_type <- aggregate(Emissions ~ year + type, NEISCC[coalMatches, ], sum)
png("plot4.png", width=640, height=480)
g <- ggplot(emissions_by_year_type, aes(factor(year), Emissions, color = type))
g <- g + geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + 
		 ggtitle('Total Emissions from coal sources from 1999 to 2008')

print(g)
dev.off()