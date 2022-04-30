install.packages('tidyverse')
heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv", 
                   na.strings = c("NA", "-99", "-", " "))
library(tidyverse)
library(dplyr)
library(tidyr)
library(readr)

select(heroes, 1:5)

heroes %>% 
  select(1:5)

heroes %>% 
  select(id = X)

heroes %>% 
  rename(id = X)

heroes %>% 
  rename_with(toupper)

heroes %>% 
  relocate(Publisher, .after = name)

heroes %>% 
  relocate(Publisher, where(is.numeric), after = name)

heroes %>% 
  relocate(id = X, .after = Gender)

heroes %>% 
  select(Height) %>% 
  pull()

heroes %>% 
  pull(Height, name)

powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")

powers %>% 
  select(1:4)

powers %>% 
  select(Reflexes:Empathy)

powers %>% 
  select(!hero_names)

heroes %>% 
  slice(c(5,100:106))

heroes %>% 
  filter(`Eye.color` == 'blue',
         `Hair.color` %in% c('Blond', 'blond'),
         Height > 184)
heroes %>% 
  slice_max(Weight, n=10, with_ties = FALSE) # последний параметр для вытаскивания ровно 10 значений, даже если есть одинаковые

heroes %>% 
  slice_sample(n=3)

heroes %>% 
  slice_sample(prop = .01) 


heroes %>% 
  drop_na()

heroes %>% 
  drop_na(Weight, Height) # только в этих колонках

heroes %>% 
  arrange(desc((Weight))

heroes %>% 
  arrange(Gender, Weight)


heroes %>% 
  filter(Weight > 500)

heroes %>% 
  filter(Weight > 500 & Gender == 'Female')

heroes %>% 
  filter(Race == 'Human' & Gender == 'Female') %>%
  slice(1:5)

heroes %>% 
  select(name, Gender, Height) %>% 
  arrange(Height)

heroes %>% 
  select(name, Gender, Height) %>% 
  arrange(desc(Height))

heroes %>% 
  select(name, Gender, Height) %>% 
  arrange(Gender, desc(Height))          


heroes %>% 
  mutate(bmi = Weight/((Height/100)^2), .after = Height) %>% # добавление колонки ко всем остальным
  slice_max(bmi, n=10)

heroes %>% 
  transmute(bmi = Weight/((Height/100)^2)) # вывод только одной новой колонки

heroes = as.tibble(heroes)
heroes

heroes %>% 
  transmute(bmi = Weight/((Height/100)^2))

heroes %>% 
  mutate(height_m = Height/100) %>% 
  select(name, height_m)

# aggregation

heroes %>% 
  transmute(bmi = Weight/((Height/100)^2)) %>% 
  summarise(mean_bmi = mean(bmi, na.rm = TRUE))


heroes %>% 
  transmute(bmi = Weight/((Height/100)^2)) %>% 
  arrange(bmi) %>% 
  summarise(first=first(bmi),
            tenth=nth(bmi, 10),
            last=last(bmi))

heroes %>% 
  group_by(Gender, Alignment) %>% 
  summarise(mean_weight = mean(Weight, na.rm=TRUE))
