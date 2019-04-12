# Learning R
# Friday, April 12

#Initialize cats data frame
cats <- data.frame(coat = c("calico", "black", "tabby"), 
                   weight = c(2.1, 5.0,3.2), 
                   likes_string = c(1, 0, 1))

write.csv(x= cats, file= "data/feline.csv")

# an intentional error
cats$weight + cats$coat

# what type of variable?
typeof(cats$weight)

# what class is cats?
class(cats)

#let's talk about vectors
# logicals
my_vector
my_vector <- vector(length = 3)

# another vector: character
another_vector <- vector(mode = "character", length = 3)
another_vector

# another vector: exploratory command
str(another_vector)
str(cats$coat)
str(cats$weight)
str(cats$likes_string)

# make a new vector
combine_vector <- c(2, 6, 3)
combine_vector
