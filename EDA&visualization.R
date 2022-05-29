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
install.packages("gameofthrones")
library(gameofthrones)           
install.packages('png')
library("png")
install.packages('patchwork')
library("patchwork")
install.packages('ggimage')
library('ggimage')
img = "https://img.freepik.com/free-photo/old-paper-texture-background_118047-1365.jpg?w=1380"


battles <-  read_csv('battles.csv')
View(battles)

df <- select(battles, c('attacker_size', 'defender_size', 'attacker_outcome'))
df

sum(c(df$attacker_size > df$defender_size), na.rm = TRUE)
sum(c(df$defender_size > df$attacker_size), na.rm = TRUE)

ggplot(data = df) +
  geom_bar(aes(x = attacker_outcome, fill = attacker_outcome))

ggplot(data = df, aes(x = attacker_outcome)) +
  geom_bar(aes(fill = attacker_outcome), position = position_stack(reverse = TRUE)) +
  theme(legend.position = "top")


win1 <- sum(df$attacker_size > df$defender_size & df$attacker_outcome == 'win')
loss1 <- sum(df$attacker_size > df$defender_size & df$attacker_outcome == 'loss')

df1 <- data.frame(win1, loss1, sum(df$attacker_size > df$defender_size))
colnames(df1) <- c('wins', 'losses', 'sum')
df1
              
win2 <- sum(df$attacker_size < df$defender_size & df$attacker_outcome == 'win')
loss2 <- sum(df$attacker_size < df$defender_size & df$attacker_outcome == 'loss')

df2 <- data.frame(win2, loss2, sum(df$attacker_size < df$defender_size))
colnames(df2) <- c('wins', 'losses', 'sum')
df2

ggplot(data = df1) +
  geom_bar(aes(x = ""))


ggplot(data = df1) +
  geom_bar(aes(x = 'attacker_outcome'), stat = 'identity', position = position_stack(reverse = TRUE)) +
  theme(legend.position = "top")


View(df)
View(df1)
View(df2)

hist(df)


attackers <- ggplot(data = battles) +
  geom_bar(aes(x = attacker_1, fill = attacker_1)) +
  scale_fill_got(discrete = TRUE, option = "Stark2") +
  xlab('Attacker House') +
  ylab('Count') +
  labs(fill = 'House') +
  theme_classic() +
  theme(legend.position = 'none') +
  theme(axis.text.x = element_text(size=11))

attackers <- ggbackground(attackers, img)
attackers

defenders <- ggplot(data = battles) +
  geom_bar(aes(x = defender_1, fill = defender_1)) +
  scale_fill_got(discrete = TRUE, option = "Lannister") +
  xlab('Defender House') +
  ylab('Count') +
  labs(fill = 'House') +
  theme_classic() +
  theme(legend.position = 'none') +
  theme(axis.text.x = element_text(size=11))

defenders
defenders <- ggbackground(defenders, img)

ggplot(data = battles) +
  geom_bar(aes(x = defender_1, fill = defender_1)) +
  scale_fill_got(discrete = TRUE, option = "Lannister") +
  theme_minimal()


ggplot(data = df) +
  geom_bar(aes(x = ('attacker_size' < 'defender_size' & 'attacker_outcome' == 'win')))


ggplot(data = battles) +
  geom_bar(aes(x = battle_type, fill = battle_type)) +
  scale_fill_got(discrete = TRUE, option = "Baratheon") +
  theme_minimal()

battles[!(battles$major_death == 0)]




