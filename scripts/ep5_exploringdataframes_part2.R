#Exploring Data Frames

#explore gapminder data set
#gapminder was downloaded in ep 2 Project Management

#READ in gapminder.csv
gapminder <- read.csv("data/gapminder_data.csv")

#visually inspect our imported data set
#click on gapminder

#STRUCTURE of gapminder
#remember data classes: int, num, factor
str(gapminder)

#SUMMARY
#Factor columns are summarized by number of items in each level
#numeric or integer columns are summarized by the descriptive stats (quartiles and means)
#character columns are summarized by its length, class, and mode.
summary(gapminder)
min(gapminder$year)

#summary of gapminder, by country column
summary(gapminder$country)

#Object Type
#what is the object type in the year column?
typeof(gapminder$year)
#integer

#what is the object type in the country column?
typeof(gapminder$country)
#also integer

#LENGTH (number of columns)
length(gapminder)
