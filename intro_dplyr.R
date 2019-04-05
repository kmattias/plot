# intro to dplyr
library(dplyr)
# load gapminder
gapminder <- read.csv("data/gapminder_data.csv", 
                      stringsAsFactors = FALSE)
# stringsasfactors will pull in text string only, not a factor
# to change back
gapminder$continent <-  as.factor(gapminder$continent)
gapminder$continent <- as.character(gapminder$continent)
gapminder$continent <-  as.factor(gapminder$continent)

mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])

# this is a pipe: %>%
#functions we will learn today from dplyr:
# select()
# filter()
# group.by()
# summarize()
# mutate()

# select attributes in gapminder:
colnames(gapminder)
subset_1 <- gapminder %>%
  select(country, continent, lifeExp)
str(subset_1) #summary
head(subset_1) #view header and top features

# select every attribute except 2
subset_2 <- gapminder %>%
  select (-lifeExp, -pop)
str(subset_2)

# select some attributes but rename some
subset_3 <- gapminder %>%
  select(country, population = pop, lifeExp, gdp = gdpPercap)
str(subset_3)

# using filter()
africa <- gapminder %>% 
  filter(continent == "Africa") %>% 
  select(country, population = pop, lifeExp)
str(africa) # still retains all countries, just as 0

# not using pipe
africa <- filter(gapminder, continent == "Africa")
africa <- select(africa, country, population, lifeExp)
# to view a table of all the countries
africa_table <- table(africa$country)
View(africa_table)

#select year, population, country for Europe
europe <- gapminder %>% 
  filter(continent == "Europe") %>% 
  select(year, pop, country)
str(europe)
europe_table <- table(europe$country, europe$year) #count not value
View(europe_table)
