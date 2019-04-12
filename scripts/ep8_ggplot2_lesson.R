#episode 8 creating publication-quality graphics with ggplot2

# #open ggplot2 library, we installed this morning
library(ggplot2)
#intiate new variable called gapminder, to read gapminder file in
#data folder
gapminder <- read.csv("data/gapminder_data.csv")

#visually inspect gapminder

#DATA SUBSETTING
#looking at row 1, column 1
gapminder[1,1]
#look at row 1
gapminder[1, ]
#preview top few lines
head(gapminder)
#preview bottom few lines
tail(gapminder)

#call ggplot function to create new plot, GLOBAL option, applies 
#to ALL layers
#aes - aesthetic properties, x and y locations; looks for colun
#headings, nice!
#geom - this later tells us how we want to visually represent data
#(geom_point - scatterplot)
#let's plot gdPercap vs. lifeExp
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() #second layer, scatter plot

#easy CHALLENGE 1
#modify line above to show how life expectancy has changed over time
ggplot(data = gapminder, aes(x = year, y = lifeExp)) +
  geom_point()

#medium CHALLENGE 2
#aesthetic property of color
#modify code to color the points by continent column
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_point()

##LAYERS
#add geom_line layer instead of geom_point
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country, color = continent)) +
  geom_line()
#let's try a line plot for each continent instead of each country
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) + #base layer
  geom_line() + #line plot layer
  geom_point() #scatter plot layer

#let's add a theme
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) + #base layer
  geom_line() + #line plot layer
  geom_point() + #scatter plot layer
  theme_bw()

#draw points on top of lines, black color for points
#added aes parameter within geom_line
#not global! notice points now black
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) + #base layer
  geom_line(aes(col = continent)) + #line plot layer
  geom_point() #scatter plot layer

#TIP
#change color of all lines to purple
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) + #base layer
  geom_line(colour = "purple") + #line plot layer #no aes if no parameter
  geom_point() #scatter plot layer
  
#change color of all lines to blue
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) + #base layer
  geom_line(colour = "blue") + #line plot layer #no aes() if no variable parameters
  geom_point() #scatter plot layer

#CHALLENGE 3
#switch order of point and line layers from previous example
#change color of all lines to purple
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) + #base layer
geom_point() + #scatter plot layer 
geom_line(colour = "blue")  #line plot layer #no aes() if no variable parameters

#TRANSFORMATION AND STATISTICS

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point()

#hard to see the relationship between points due to strong outliers in GDP per capita
#let's change scale of units on x axis using scale function
#log 10 function applies transformation to values of gdpPercap column

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + #base layer
  geom_point(alpha = 0.5) + #changed transparency of points to 50%
  scale_x_log10()

#side note: alpha can also be mapped to a variable in the data

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + #base layer
  geom_point(aes(alpha = continent)) + #aes allows us to map by variable, like continent
  scale_x_log10() 

#geom_smooth, adding another layer here

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + #base layer
  geom_point() + #aes allows us to map by variable, like continent
  scale_x_log10() +
  geom_smooth(method = "lm") #geom smooth layer - linear model

#make geom_smooth line thicker

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + #base layer
  geom_point() + #aes allows us to map by variable, like continent
  scale_x_log10() +
  geom_smooth(method = "lm", col = "red", size = 2) 

#CHALLENGE 4a
#modify color and size of points on the point layer

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + #base layer
  geom_point(col = "blue", size = 1.0) + 
  scale_x_log10() +
  geom_smooth(method = "lm", col = "red", size = 1.5) 

#CHALLENGE 4b
#modify abobe solution so that points are now a different shape and colored by continent

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + #base layer
 ? geom_point(col = "blue", shape = continent, size = 1.0) + 
  scale_x_log10() +
  geom_smooth(method = "lm", col = "red", size = 1.5) 

#MULTI-PANEL FIGURES
#look at life expectancy over time across all countries
#split into multiple graphs side by side

#start by subsetting data function to pull out part of character string
#letters that occur in posiitions start through stop
#(in this case looking at first letter of "A" or "Z")
#create new subset or substring called starts.width

starts.with <- substr(gapminder$country, start=1, stop=1) #substr(x, start, stop)

#operator %in% allows us to make multiple comparisons
#create new subset called az.countries

az.countries <- gapminder[starts.with %in% c("A", "Z"),]
az.countries

#initiate ggplot
#adding line plot layer
#facet wrap took above "formula" as its argument, denoted by ~
#this tells R to draw panel for wach unique value
#in country column of gapminder data set

ggplot(data = az.countries, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() +
  facet_wrap( ~ country) #facet wrap


