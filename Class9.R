install.packages('tidyverse')
library(tidyverse)
install.packages('dplyr')
library(dplyr)
install.packages('readr')
library(readr)
library(stringi)
library(stringr)

affirmation <- 'Я выучу R за май'

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv")
bowie <- read_csv2("https://raw.githubusercontent.com/Pozdniakov/sirius_advanced/master/data/bowie2.csv")


mean(nchar(bowie$lyrics), na.rm=TRUE)

substr(affirmation, 1, 9)  
str_trunc(month$name, 6)


first_songs = bowie$song_name[1:10]
str_trunc(first_songs, 10)
str_pad(first_songs, 10, pad = '@', side = 'both')

str_squish('Hi      ,  everyone  ')

toupper(affirmation)
tolower(affirmation)
str_to_title(affirmation)

set.seed(42)
rnorm(10)

# сгененировать 10 случайных последовательностей A B C
library(stringi)
stri_rand_strings(n = 10, length =  3, pattern = '[A-C]')
stri_rand_shuffle(affirmation)
stri_rand_shuffle(rep("ABC", 10))

install.packages("htmlwidgets")
library(htmlwidgets)
names <- c('Саня', 'Ваня', 'Даня', 'Женя', 'Аня', 'Леша')
str_view_all(names, '.*ня')
str_which(names, '.*ня')
str_extract(names, '.*ня')
str_remove(names, '[аА]ня')
str_extract_all(c(names, 'Саша и Ваня'), '\\b')
str_replace(names, 'ня', 'нек')

install.packages('udpipe')
library(udpipe)
heroes_lyrics = bowie %>% 
  filter(song_name == '"Heroes"') %>% 
  pull(lyrics)

heroes_lyrics_df <- udpipe(heroes_lyrics, udpipe_download_model("english-gum"))
heroes_lyrics_df %>% 
  filter(upos != "PUNCT") %>% 
  summarise(mean(upos == 'VERB'))

str_which(bowie$song_name, '.eople')

several_texts <- bowie %>% 
  filter(song_name %in% c('"Heroes"', 'Cat People (Putting Out Fire)', 'China Girl', 
                          'Lazarus',
                          'All the Young Dudes')) %>% 
  rename(doc_id = song_name, text = lyrics) %>% 
  udpipe(udpipe_download_model("english-gum"))

several_texts %>% 
  filter(upos != "PUNCT") %>% 
  group_by(doc_id) %>% 
  summarise(mean(upos == 'VERB'))

#-----------------------------------------------------------
#-----------------------------------------------------------
#---------------------STATISTICS----------------------------
#-----------------------------------------------------------
#-----------------------------------------------------------

# Population -> Sample
#    |            |
# Parameters <- Statistics

# Scales:
# 1. Nominal (not ordered, football players, colors, IDs)
# 2. Rank (one bigger than the other, no intervals, always-sometimes-never, primary edu-secondary edu-higher edu)
# 3. Interval (Celcius)
# 4. Ratio (Kelvin)

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na.strings = c("NA", "-99", "-", " "))
weight <- heroes %>% 
  tidyr::drop_na(Weight) %>% 
  pull(Weight)

mean(weight)
median(weight)

heroes %>% 
  count(`Eye color`, sort = TRUE)

mean(weight, trim = .1)
