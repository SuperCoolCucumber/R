# APPLY FUNCTIONS
some_list <- list(some = 1:10, letters)
lapply(some_list, length) # list apply
sapply(some_list, length) # simplified apply

# replicate(100, mean(rlnorm(100))

sapply(1:10, sqrt)

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv", 
                             na.strings = c("NA", "-99", "-", " ")) 
heroes      
sapply(heroes, class)

install.packages("purrr")
library(purrr) # library with some fancy apply functions
map_df(some_list, length)
pluck(some_list, 1)

install.packages("data.table")
#----------------22.13-------------

M2 <- matrix(c(20:11, 11:20), nrow=5)
M2

apply(M2, 1, max) # in rows
apply(M2, 2, max) # in columns
apply(M2, 1, mean)
apply(M2, 2, mean)

list3 <- list(
  a = 1:5,
  b = 0:20,
  c = 4:24,
  d = 6:3,
  e = 6:25
)
# apply(list3, (1,2), max)
library(data.table)
heroes
setDT(heroes)
View(heroes)

class(heroes)
heroes[Publisher == "Marvel Comics", mean(Height, na.rm = TRUE), by = Gender][order(-V1)]

install.packages("tidyverse")
library(tidyverse)

heroes_tbl <- as_tibble(heroes)

heroes_tbl %>%
  filter(Publisher == "Marverl Comics") %>%
  group_by(Gender) %>%
  summarise(Height = mean(Height, na.rm = TRUE)) %>%
  arrange(Height)


heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv", 
         na = c("NA", "-99", "-", " "))
heroes

# %>% pipe operator CTRL SHIFT M

sum(log(sqrt(abs(sin(1:22)))))
1:22 %>% 
  sin() %>% 
  abs() %>%
  sqrt() %>%
  log() %>%
  sum()

1:22 |> sin() |> abs() |> sqrt() |> log() |> sum()
1:22 |> sin() |> abs() |> sqrt() |> log(base=2) |> sum()

#---------22.14---------
1:10 %>% 
  sum() %>% 
  sqrt()

-5:5 %>% 
  min() %>% 
  abs()

2 %>%
  sqrt() %>% 
  c('корень из 2 равен', .)


#--------------------------

heroes %>% 
  select(1, 5) # choose columns

heroes %>% 
  select('Eye color')

heroes %>% 
  select(name:Publisher) # all columns from name to publisher

heroes %>% 
  select(!X1)

heroes %>% 
  select(!(Gender:Weight))

heroes %>% 
  select(name:last_col())

heroes %>% 
  select(everything())

heroes %>% 
  select(ends_with("color"))

heroes %>% 
  select(ends_with("color") & starts_with("Eye"))

heroes %>% 
  select(where(is.numeric))

heroes %>% 
  select(where(function(x) !any(is.na(x))))
         