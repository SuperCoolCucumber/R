install.packages('tidyverse')
library(tidyverse)
install.packages('dplyr')
library(dplyr)
install.packages('readr')
library(readr)
library(stringi)
library(stringr)
install.packages('psych')
library(psych)
install.packages('skimr')
library(skimr)

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na.strings = c("NA", "-99", "-", " "))

skimr::skim(heroes)

heroes %>% 
  group_by(Gender) %>% 
  skimr::skim(ends_with('color'))

plot(heroes$Height, heroes$Weight)
plot(heroes$Weight)
plot(iris)

weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

plot(weight)
hist(weight)

boxplot(Weight ~ Gender, heroes)
# ящик -- межквартильный размах

heroes

ggplot(data = heroes) +
  geom_bar(aes(x=Gender), fill = '#22BB44')

ggplot(data = heroes) +
  geom_bar(aes(x=Gender, fill = Gender))

ggplot(data = heroes) +
  geom_bar(aes(x='', fill = Gender))

ggplot(data = heroes) +
  geom_bar(aes(x='', fill = Gender), width=.2)

ggplot(data = heroes) +
  geom_bar(aes(x='', fill = Gender)) +
  coord_polar(theta='y')
