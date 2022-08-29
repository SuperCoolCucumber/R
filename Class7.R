install.packages('tidyverse')
install.packages('dplyr')
install.packages('readr')

library(tidyverse)
library(dplyr)
library(tidyr)
library(readr)

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv", 
                   na.strings = c("NA", "-99", "-", " "))
heroes %>% 
  group_by(Gender, Alignment) %>% 
  summarise(mean(Weight, na.rm = TRUE))

table(heroes$Gender)
table(heroes$Gender, heroes$Alignment)

heroes %>% 
  group_by(Gender) %>% 
  summarise(n = n())

heroes %>% 
  count(Gender, Alignment)

heroes %>% 
  count(Race, sort = TRUE) %>% View()

heroes %>% 
  group_by(Race) %>% 
  filter(n() > 10)

heroes %>% 
  group_by(Race) %>% 
  summarise(Race_weight_mean = mean(Weight, na.rm = TRUE))


heroes %>% 
  group_by(Race) %>% 
  mutate(Race_weight_mean = mean(Weight, na.rm = TRUE)) %>% 
  select(name, Race, Weight, Race_weight_mean) %>% 
  ungroup()

heroes %>% 
  group_by(Race) %>% 
  mutate(Race_weight_mean = mean(Weight, na.rm = TRUE)) %>% 
  select(name, Race, Weight, Race_weight_mean) %>% 
  ungroup() %>% 
  mutate(variations = Weight - Race_weight_mean)

  
other_publishers <- heroes %>% 
  filter(Publisher %in% c("Marvel Comics", "DC Comics")) %>% 
  group_by(Gender) %>% 
  summarise(weight_mean = mean(Weight, na.rm = TRUE))

heroes_list_of_df <- list(DC = dc,
                          Marvel = Marvel
                          Other = other_publishers)

band_members
band_instruments

left_join(band_members, band_instruments)

band_members %>% 
  left_join(band_instruments)

band_members %>% 
  full_join(band_instruments)

band_members %>% 
  inner_join(band_instruments)

band_members %>% 
  semi_join(band_instruments)

band_members %>% 
  anti_join(band_instruments)


powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")
View(powers)

powers <- powers %>% 
  filter(`Web Creation`)

web_creators <- heroes %>% 
  semi_join(powers, by = c("name" = "hero_names"))

view(web_creators)

new_diet <- tibble(
  name = c("vova", "joe", "sasha"),
  before = c(80, 77, 81),
  after = c(65, 74, 73)
)

new_diet %>% 
  pivot_longer(cols = before:after,
                         names_to = 'time',
                         values_to = 'weight') %>% 
  pivot_wider(values_from = 
                names_from = )




#---------------------------------------------------
# CODE TO AGGREGATE CSV TABLES FROM X_AS_FOREIGN_ENG
#---------------------------------------------------

err2 <- read_csv('https://raw.githubusercontent.com/SuperCoolCucumber/R/main/err2.csv')

new <- pivot_wider(err2, names_from = 'Error_type', values_from = 'CEFR', 'name', values_fn = length)
view(new)

old <- distinct(err2, name, .keep_all = TRUE)
view(old)

new <- new %>% 
  add_column(CEFR = NA, .after = 'name')

new$CEFR <- old$CEFR

write_csv(new, 'err2.csv')
