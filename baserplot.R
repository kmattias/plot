# plotting biketown trip data with base r
install.packages("tidyverse")
library(tidyverse)
library(lubridate)

biketown <- read_csv(biketown)
biketown <- read_csv("biketown-2018-trips.csv")
str(biketown)

summary(biketown)

 # this in tidyverse
biketown$hour <- 
  hms(biketown$StartTime) %>% 
  hour()

# same at this in base
stime <- hms(biketown$StartTime)
biketown$hour <-  hour(stime)

freq_by_hour <- table(biketown$hour)
barplot(freq_by_hour)

# histogram plot of hourly bins, by three hours
hist(biketown$hour, breaks = seq(0, 24, 3))

# focus on AM peak
ampeak <- subset(biketown, hour >=7 & hour < 10)
hist(ampeak$hour, breaks = seq(7, 10, 1)) # starts at eight end up in first bin with seven, scrap
# looks at bar plot for the three hours
barplot(table(ampeak$hour))

