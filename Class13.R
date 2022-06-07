install.packages('Stat2Data')
library(Stat2Data)
library(tidyverse)
data(Backpack)

Backpack

Backpack %>% 
  select(BackpackWeight, BodyWeight) %>% 
  cor() # Pearson correlation

cor.test(Backpack$BackpackWeight, Backpack$BodyWeight)

cor.test(Backpack$BackpackWeight, Backpack$BodyWeight, method = 'spearman')

t.test(rnorm(30), rnorm(30))
many_p_norm <- replicate(10000, t.test(rnorm(30), rnorm(30), var.equal = TRUE)$p.value)
mean(many_p_norm < 0.05)

hist(rlnorm(100000), breaks = 100)
many_p_lnorm <- replicate(10000, t.test(rlnorm(30), rlnorm(30), var.equal = TRUE)$p.value)
mean(many_p_lnorm < 0.05)


Backpack %>% 
  select(BackpackWeight, BodyWeight, Units, Year) %>%
  cor() # матрица корреляций 
    
install.packages('corrr')
library(corrr)

Backpack %>% 
  select(BackpackWeight, BodyWeight, Units, Year) %>%
  correlate() %>% # матрица корреляций 
  shave() %>% 
  fashion()

install.packages('ez')
library(ez)


iris %>% 
  mutate(id = row_number()) %>% 
  ezANOVA(dv = Petal.Length, between = Species, wid = id)


t.test(Backpack$BackpackWeight ~ Backpack$BackProblems, paired = FALSE, var.equal = TRUE)
cor.test(Backpack$BackpackWeight, Backpack$BackProblems)
lm(Backpack$BackpackWeight ~ Backpack$BackProblems) %>% summary()
