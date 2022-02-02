#installing packages
install.packages("tidyverse")

#loading my starwars data set from tidyverse
library(tidyverse)
view(starwars)

#variable types
glimpse(starwars)
class(starwars)
unique(starwars$gender)

#since gender is a categorical variable, let's change it from char to factor
starwars$gender <- as.factor(starwars$gender)
class(starwars$gender)

#checking the gender levels
levels(starwars$gender)

#changing the levels of the gender
starwars$gender <- factor((starwars$gender), levels = c("masculine","feminine"))
levels((starwars$gender))

#now let us do some filtering
starwars %>% 
  select(name, height, ends_with("color")) %>% filter(hair_color %in% c("blond","brown") & height < 180)
  