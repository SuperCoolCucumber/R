vec <- seq(-3, 3, 0.1)

dnorm(1) # probability density function
dnorm(0)
dnorm(-1)

vec
plot(vec, dnorm(vec))

iq <- seq(50, 150, 0.1)
plot(iq, dnorm(iq, mean = 100, sd = 15))
pnorm(100, mean = 100, sd = 15) # probability mass function?
pnorm(130, mean = 100, sd = 15)


prob <- seq(0, 1, 0.01)
prob
plot(prob, qnorm(prob, mean = 100, sd = 15)) # qunatile function

set.seed(42)
rnorm(5) # выдает 5 значений из нормального стандартного распределения

samp = rnorm(100, mean = 100, sd = 15)
samp
hist(samp)

?Distributions
?df

v <-seq(0, 10, by = 0.1)
plot(v, df(x = v, df = 4, df2 = 10))
     

plot(dcauchy(x = v, location = 5, scale = 2, log = FALSE))
plot(pcauchy(q = v, location = 0, scale = 1, lower.tail = TRUE, log.p = FALSE))
plot(qcauchy(p = v, location = 5, scale = 1, lower.tail = TRUE, log.p = FALSE))
plot(rcauchy(n = v, location = 0, scale = 1))
