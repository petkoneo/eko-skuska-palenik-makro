print('R studio is nice')

# Variable class request
a <- 'Hello'

bool <- T

class(a) # returns character

class(bool) # returns logical

# Vector - one dimensional array
# c() - combine function
nvec <- c(1, 2, 3, 4, 5)

class(nvec)

# You can not mix multiple datatpyes in single array - vector

# Rewriting vector names
temp <- c(30, 28, 36, 40)

names(temp) <- c('Pon', 'Uto', 'Str', 'Strv')

print(temp)

# Vector operation
v1 <- c(1, 2, 3)
v2 <- c(4, 5, 6)

print(v1 + v2)

print(v1 - v2)

print(v1 / v2)

# Basic statistical things
mean(v1)
# std deviation
sd(v1)

max(v1)

min(v1)

a <- 10
b <- 20
ls()  # list objects in global env
rm(a)  # delete the object 'a'
# rm(list = ls())  # caution: delete all objects in .GlobalEnv
gc()  # free system memory