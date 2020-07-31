emissions_data <- readRDS("summarySCC_PM25.rds")
class_code <- readRDS("Source_Classification_Code.rds")

baltimore_data <- subset(emissions_data, emissions_data$fips=="24510")
baltimore_type_year <- aggregate(baltimore_data$Emissions,
                                 by=list(baltimore_data$type, baltimore_data$year),
                                 FUN=sum)
colnames(baltimore_type_year) <- c("Type", "Year", "Emissions")

library(ggplot2)
png(filename = "plot3.png")
qplot(Year, Emissions, data = baltimore_type_year, color = Type, geom = "line") +
        ggtitle("Total Emissions of PM2.5 in Baltimore City By pollutant type") +
        ylab("Total Emissions (tons)") +
        xlab("Year")
dev.off()plot3.R
