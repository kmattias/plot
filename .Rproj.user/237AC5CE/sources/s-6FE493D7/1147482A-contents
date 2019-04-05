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

# working with group_by() & summarize
str(gapminder %>% group_by(continent)) # subsetting w/in dataframe
# temp store, no change to data

# summarize mean gdp, mean lifeExp per continent
gdp_continent <- gapminder %>% 
  group_by(continent) %>% 
  summarise(mean_gdp = mean(gdpPercap), mean_lifeExp = mean(lifeExp))

str(gdp_continent)

# plot to bar chart using ggplot
library(ggplot2)
summary_plot <- gdp_continent %>% 
  ggplot(aes(x = mean_gdp, y = mean_lifeExp)) +
  geom_point(stat = "identity") +
  theme_bw()
summary_plot

# calc mean pop for all continents
meanpop_continent <- gapminder %>% 
  group_by(continent) %>% 
  summarise(mean_pop = mean(pop))

# count () & n()
  # freq count for 2002 records by continent
  # two == when looking for a value or comparison
  # one = argument or formula (assignment)
gapminder %>% 
  filter(year == 2002) %>% 
  count(continent, sort = TRUE)

  # using n to cal stand dev and stand err
gapminder %>% 
  group_by(continent) %>% 
  summarise(se = sd(lifeExp)/sqrt(n()))

# mutate() is my friend x*y=z

xy <- data.frame(x = rnorm(100),
                 y = rnorm(100)) # generates random #s
head(xy)
  #view table
  #create new column, writes to env, not to csv
xyz <- xy %>%
  mutate(z = x*y)
head(xyz)
  #can write to csv or sep file later

# add full gdp column to gapminder gdp, then per continent
gdp_per_country <- gapminder %>%
  mutate(gdp_per_cont = gdpPercap*pop)
head(gdp_per_country)

# can skip second mutate
gdp_per_cont <- gapminder %>% 
  mutate(total_gdp = pop*gdpPercap) %>% 
  group_by(continent) %>%
  summarise(cont_gdp = sum(total_gdp))
