#installing pachakges
install.packages("tidyverse")

#loading my starwars dataset from tidyverse
library(tidyverse)
view(starwars)

#variable types
glimpse(starwars)
class(starwars)
unique(starwars$gender)

#since gender is a categotical variable, let's change it from char to factor

