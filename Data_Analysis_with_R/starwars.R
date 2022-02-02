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
  
#Now let's deal with our missing data
#we calc the mean of the height without the missing value
mean(starwars$height, na.rm = TRUE)

#we could just omit the missing values using na.omit() but that is not recommended because we might lose very important data we need
#we can try to understand where our value is missing by filtering out where we have na
starwars %>%
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.))%>%
  drop_na(height)

#we want to replace na with 'none' in our hair colour
starwars %>%
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.))%>%
  mutate(hair_color = replace_na(hair_color, "none"))
  