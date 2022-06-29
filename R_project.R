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
install.packages("pacman")         #
library("pacman") 
install.packages('ggpubr')
library(ggpubr)


pacman::p_load(
  rio,          
  here,      
  skimr,        
  tidyverse,  
  gtsummary,   
  rstatix,      
  corrr,        
  janitor,      
  flextable     
)


linelist <- import("linelist_cleaned.rds")
View(linelist)

linelist <- drop_na(linelist)
df2<-subset(df1, Name!="George" & Name!="Andrea")
df2
linelist <- subset(linelist, outcome!='Recover')

linelist %>%
  group_by(gender) %>%
  get_summary_stats(age_years, type = "mean_sd")

# the Welch’s t-test, which is less restrictive compared to the original Student’s test. 
# This is the test where you do not assume that the variance is the same in the two groups, 
# which results in the fractional degrees of freedom.

## compare mean age by outcome group with a t-test
t.test(age_years ~ gender, data = linelist, detailed = TRUE)

pacman::p_load(rio,       
               here,    
               tidyverse, 
               apyramid,  
               janitor,   
               stringr)   

boxplot(age_years ~ gender, data = linelist)
title("Death age of female patients vs male patients")

p <- linelist %>% 
  ggplot(aes(y = age_years, x = gender, fill = gender)) + 
  geom_violin()+
  #scale_fill_manual(values = c("#BD20DC", "#7320DC"))+
  theme_classic()+
  theme(legend.position = "none")+   # remove legend (redundant) 
  labs(title = "Age of death by gender") 


p + stat_summary(fun=mean, geom="point", size=2, color = 'black')
#p + gradient_color("red")
