# reading data in
library(readxl)
library(tidyverse)
vacancy <- read_excel("Downloads/histtab1.xlsx", sheet = "Sheet1", skip = 3, col_types = "numeric",
                      col_names = c("Year_and_Quarter","United_States","Inside_MSAs","Inside_Principal_Cities","Inside_Suburbs",
                                    "Outside_MSAs","Northeast","Midwest","South","West"))

# creating table labels
# data for 1972, 1979, 1989, 1993, 2002 had revisions

vacancy <- vacancy[c(2:90,98:139,146:204,212:234,242:295,301:408),]
vacancy <- filter(vacancy, is.na(United_States) == FALSE)
names <- c(0:(length(vacancy$Midwest)-1))/4 + 1957
vacancy$Year_and_Quarter <- names



ggplot(data = vacancy, aes(Year_and_Quarter,United_States)) + 
  geom_point() + 
  geom_smooth(col = rgb(0,146,10, max=255), size = 2, se = FALSE, span = 0.25) + 
  xlab("Time (by year/quarter)") + 
  ylab("Vacancy rate (% of rentals)") +
  labs(title = "US Rental Vacancy Rate over Time (1956-2019)",
         caption = "Graph by Lemna Statistics. Source: United States Census Bureau, 2020")