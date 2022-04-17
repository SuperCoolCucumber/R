n <- 1:4
k <- 0:1
n*k
n*2
h <- c(0,1,10)
n*h
1:10 * c(2,10)

# 22.4 векторизация
p <- 4:7
q <- 0:3
p
q
p+q
p-q
p/q
p^q
p*10

(1:10)^2
0:20 * c(0,2)
0:20 * c(0,+2)


2 * 1:20
2 ^ 1:20
2 ^ c(1:20)


1 * c(1:10)

#--------

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[1]
n[length(n)]
n[3] <- 20
n
n[4:7]
rev(n)
n[length(n):1]
n[3:5] <- 0
n
n[-1]
n[-2]
n[-6]
n
n[c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)]

#-----

d <- 1:4
names(d)
letters
LETTERS
names(d) <- letters[1:4]
mean(n)
n>mean(n)
n[n>mean(n)]

# 22.5 индексирование векторов

vec3 <- c(3, 5, 2, 1, 8, 4, 9, 10, 3, 15, 1, 11)
vec3[2]
vec3[2][5]
vec3[100]

vec3[length(vec3)]
vec3[-length(vec3)]
vec3[vec3>4 and vec3<10]
vec3 <- vec3[vec3>4]
vec3
vec3 <- vec3[vec3<10]
vec3
vec3 <- c(3, 5, 2, 1, 8, 4, 9, 10, 3, 15, 1, 11)
vec3 ^2
vec3 ^ 0.5
vec3[vec3>4 & vec3<10]

(1:20)[c(FALSE, TRUE)]
1:10 * 2
(1:20)[1:20 %% 2 == 0]

#----

eyes <- c('green', 'blue', 'blue', 'brown', 'green', 'blue')
eyes == 'blue'
sum(eyes == 'blue')
mean(eyes == 'blue')
all(eyes == 'blue')
any(eyes == 'blue')
which(eyes == 'blue')
eyes[eyes == 'blue' | eyes == 'green']
