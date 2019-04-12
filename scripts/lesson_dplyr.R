## Learning dplyr - Dataframe Manipulation with dplyr

rm(list = ls ()) #do this to clear environment
#also good practice to go to session, restart R
#Tidyverse has R packages for data science

install.packages("tidyverse")
library(dplyr)   
library(ggplot2)

gapminder <- read.csv("data/gapminder_data.csv")
str(gapminder)

# using select function to pick certain columns
# %>%same as pipe in bash; Shift - Ctrl - M
year_country_gdp <- gapminder %>% select(year, country, gdpPercap)
str(year_country_gdp)

# using filter function to pick certain rows
#== means exactly this
year_country_gdp_euro <- gapminder %>%
  filter(continent == "Europe") %>% 
  select(year, country, gdpPercap)
str(year_country_gdp_euro)
# note: you can't select before filter or it wont work!

#using dplyr for grouping variables
gdp_by_continent <- gapminder %>% #creates name for new dataframe
  group_by(continent) %>%  #groups by continent
  summarize(mean_gdp = mean(gdpPercap)) #mean_gdp by continent
gdp_by_continent

#CHALLENGE 2 calculate the average life expectancy per country

lifeExp_by_country <- gapminder %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp = mean(lifeExp))
str(lifeExp_by_country)

#which has the longest average life expectancy and which has the shortest?

max(lifeExp_by_country$mean_lifeExp) #gives max, but which country?

lifeExp_by_country %>% filter(mean_lifeExp == max(mean_lifeExp))

#filters for rows, select for columns!

lifeExp_by_country %>% filter(mean_lifeExp == max(mean_lifeExp) | mean_lifeExp == min(mean_lifeExp))

#integrating ggplot and dplyr

gapminder %>% 
  group_by(country, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  ggplot(aes(x = country, y = mean_lifeExp)) + geom_point()
