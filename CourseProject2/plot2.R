NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

# aggregate the emissions by year & rename the columns

emissions_by_year <- aggregate(Emissions ~ year, NEI[NEI$fips=="24510", ], sum)

png('plot2.png')

barplot(height=emissions_by_year$Emissions, names.arg=emissions_by_year$year, xlab="years", 
		ylab=expression('total PM'[2.5]*' emission'),
		main=expression('Total PM'[2.5]*' MD emissions at various years'))

dev.off()

