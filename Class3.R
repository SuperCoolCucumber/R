NA == NA
NA == 0
n <- c(1, 1, 2, 3, 5, 8, 13)
n[5] <- NA
n

is.na(NA)
is.nan(NA)

1/0
-1/0
0/0

mean(n)
mean(n[!is.na(n)])
mean(n, na.rm=TRUE)

# vector: order and type
# list: different types
# matrix: two dimensions
# array: multi-dimensional

A <- matrix(1:20, nrow=5) # row and column indicies
A

A[2,3]
A[4,4]
A[2:4, 2:3]
A[,1:2]
A[2,]
A[2, drop=FALSE]

identical(1, '1')
1 == '1' # имплицитное приведение типов

A[,] <- 100
A[2:3, 2:3] <- 0
A
A[1:10]

attributes(A)
attr(A, 'dim') <- NULL
A

#------22.7--------

M1 <- matrix(1, nrow=4, ncol=4)
M1[2:3, 2:3] <- 2
B <- M1[,2:3]
B
#--------------------

simple_list <- list(42, 'Hi', TRUE)
complex_list <-  list(1:10, letters, simple_list)
complex_list
str(complex_list)
named_list <- list(age = 27,
                   plays = 'гитара',
                   alive = FALSE)
named_list
class(named_list[1])
named_list[[1]]

list1 <-  list(numbers = 1:5, letters = letters, logic = TRUE)
list1[1]
list1['numbers']
list1[1]

df <- data.frame(name = c("Petr", "Vasya", "Gleb", "Jules", "Evdokia"),
           age = c(30, 15, 35, 23, 63),
           vaxxed = c(TRUE, FALSE, FALSE, TRUE, TRUE))
df
str(df)
view(df)

df$age
df$lovesR <- TRUE
df
df[1:2, c('age', 'lovesR')]
tail(df[df$age < mean(df$age),], 2)

#------22.9------------

data(mtcars)
mtcars
str(mtcars)
mtcars[3,4]
mtcars[1:6, 1:6]
mtcars$wt
mtcars[c('hp', 'mpg', 'cyl')]
sum(mtcars$cyl == 4)
mean(mtcars$cyl == 4)
mtcars['hp' >= 100,]

install.packages("beepr")
library(beepr)
beep()
?beep
beep("fanfare")

if(!require(devtools)) {install.packages("devtools")}
devtools::install_github("brooke-watson/BRRR")

skrrrahh()
