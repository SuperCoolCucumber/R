library(stringi)
library(stringr)
library(glue)
install.packages('udpipe')
library(udpipe)

months <- tibble(number = 1:12,
       name = month.name)

paste(months$number, months$name)

months %>% 
  mutate(number_name = paste(number, name, sep = '_'))

paste(months$number, months$name, sep='_', collapse='++++')

sprintf('%s is month %i in year', months$name, months$number)
glue('{months$name} is month {months$number} in year')

view(heroes)

glue("{heroes$name} is good, his weight is {heroes$Weight}, his height is {heroes$Height}")

glue("{heroes$name} is good, {case_when(heroes$Gender == 'Male' ~ 'his', heroes$Gender == 'Female' ~ 'her')} weight is {heroes$Weight}, his height is {heroes$Height}")


tibble(
  film = c("Leon", "Wasabi", "5th Element"),
  genre = c("criminal, drama",
           "comedy",
           "sci-fi, comedy, criminal")
) %>% 
  # mutate(genre = str_split(genre, ", ")) %>% 
  # unnest_longer(genre)
  separate_rows(genre, sep = ", ") %>% 
  mutate(value = TRUE) %>% 
  pivot_wider(names_from = "genre", values_from = "value", values_fill = 0)
