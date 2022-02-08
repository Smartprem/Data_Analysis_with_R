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

#Changing variable
starwars %>% 
  rename("movies" = "films") %>% 
  glimpse()

#Reordering Variable
starwars %>% 
  select(name, gender, height, everything())

#checking the gender levels
levels(starwars$gender)

#changing the levels of the gender
starwars$gender <- factor((starwars$gender), levels = c("masculine","feminine"))
levels((starwars$gender))

#now let us do some filtering
starwars %>% 
  select(name, height, ends_with("color")) %>% filter(hair_color %in% c("blond","brown") & height < 170)
  
#Now let's deal with our missing data
#we calc the mean of the height without the missing value
mean(starwars$height, na.rm = TRUE)

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
#Let's say we are don't want to over write and we want to create a new column we use
 # mutate(hair_color2 = replace_na(hair_color, "none"))
  
#Now let's talk about duplicates
#We can't use this starwars data set because it does not have any duplicate, so let's go ahead to create a dataframe to illustrate this
Names <- c('Stephen', 'Daniel', 'Jackson', 'Stephen', 'Sophia', 'Olivia', 'Mia')
Age <- c(20, 25, 28, 20, 19, 29, 30)

Friends <- data_frame(Names, Age)
Friends
#getting to know what row is a duplicate or not, we can decide to use the normal/old way or we can use the tidyverse way
#normal way of seeing the duplicate
Friends [duplicated(Friends),]
#we can add ! before duplicated to get the rows that does not have a duplicate
Friends [!duplicated(Friends)]

# now let us use the tidyverse method
Friends %>% 
  distinct() %>%
  view()

#Now let's talk about Recording Variable
# Here we are going to code our gender column to one and two
startwars %>% select(name, gender)
starwars %>% 
  select(name, gender) %>%
  mutate(gender = recode (gender, 'masculine' = 1, 'feminine' = 2))
view(starwars)
