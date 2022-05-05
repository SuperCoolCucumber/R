install.packages('tidyverse')
library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv")
bowie <- read_csv2("https://raw.githubusercontent.com/Pozdniakov/sirius_advanced/master/data/bowie2.csv")
install.packages('dplyr')
library(dplyr)
install.packages('readr')
library('readr')

heroes %>% 
  select(!X1) %>%
  #slice(1:6) %>%
  filter(`Hair color` == 'Black') %>%
  mutate(human = Race == 'Human') %>%
  group_by(Gender) %>%
  summarise(height = mean(Height, na.rm = TRUE))

heroes %>%
  group_by(Gender) %>%
  summarise(height = mean(Height, na.rm = TRUE),
            weight = mean(Weight, na.rm = TRUE))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight), mean))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(where(is_numeric), mean))

heroes %>%
  mutate(across(where(is.factor), as.factor))

z <- function(x) (x - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE)

iris %>%
  mutate(across(where(is.numeric), z))
