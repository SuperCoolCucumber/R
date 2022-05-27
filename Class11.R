install.packages('tidyverse')
library(tidyverse)
install.packages('dplyr')
library(dplyr)
install.packages('readr')
library(readr)
install.packages('ggplot2')
library('ggplot2')
library(stringi)
library(stringr)


heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv", 
                   na.strings = c("NA", "-99", "-", " "))
plot(iris)

ggplot(data=iris) +
  geom_histogram(aes(x = Petal.Width), bins=20, fill='orange')


ggplot(data=iris) +
  geom_histogram(aes(x = Petal.Width, fill = Species), bins=20)


ggplot(data=iris) +
  geom_histogram(aes(x = Petal.Width, fill = Species), bins=20, 
                 position = 'identity', alpha = 0.7) + # альфа это прозрачность
  facet_wrap(~Species) # разделять на несколько графиков

ggplot(data=iris) +
  geom_histogram(aes(x = Petal.Width, fill = Species), bins=20, 
                 position = 'identity', alpha = 0.7) +
  facet_wrap(~Species, ncol=1)

ggplot(data=iris) +
  geom_density(aes(x = Petal.Width, fill = Species), adjust = 1.5, # сглаженная гистограмма, рисует распределение
                 position = 'identity', alpha = 0.7) +
  theme_minimal() 

ggplot(data=iris, aes(x = Species, y = Petal.Width)) + # накладывание разых видов графиков
  geom_violin(aes(fill = Species), 
              position = 'identity', alpha = 0.8, colour = NA) +
  geom_boxplot(position = 'identity', alpha = 0.9, outlier.color = NA) + 
  theme_minimal()


install.packages('ggsci') # color maps library
library(ggsci)


ggplot(data=iris, aes(x = Species, y = Petal.Width)) +
  geom_violin(aes(fill = Species), 
              position = 'identity', alpha = 0.8, colour = NA) +
  geom_boxplot(position = 'identity', alpha = 0.9, outlier.color = NA) +
  ggsci::scale_fill_lancet() + # палитра как функция
  theme_minimal()



# ------------22.25------------

heroes %>% 
  mutate(Publisher = ifelse(Publisher %in% c('DC Comics', 'Marvel Comics'),
                            Publisher,
                            "Other publishers")) %>%
  ggplot(aes(x = Publisher)) +
  geom_bar()



#-----------------------------


df <- read.table("/cloud/project/meta_dataset.txt", sep="\t", header=T)


df %>% 
  filter(Design %in% c("Policy Change", "Control Prior IQ")) %>% 
  ggplot(aes(x = Outcome_age, y = Effect_size, size = 1/(SE^2), color = Design, fill = Design)) +
  geom_point(alpha = .55) +
  geom_smooth(method = 'lm', size = .5, alpha = .25) +
  geom_hline(yintercept = 0, linetype = 'dotted') +
  scale_x_continuous(breaks = seq(20, 80, by = 10)) +
  labs(x = "Age at outcome test (years)", 
       y = "Gain for 1 year of education\n(IQ points)") +
  guides(size = 'none', color = "none", fill = "none") +
  coord_cartesian(xlim = c(15, 85)) +
  facet_wrap(~Design, ncol = 1) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


heroes %>% 
  filter(heroes$Race) %>% 
  ggplot(aes(x = Race, fill = Race)) +
  geom_histogram( bins = 20, colour = 'red')

                 