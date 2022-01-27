library(table1)

#Base functions

x <- 5
y <- 7

z <- x*y

#Vectors hold one "type" of data, and hold multiple items of it
#Types of data: numeric, character, factor, date
things <- c("ball", "soldier", "doll", "paint-set")
things2 <- c(1.99, 2.49, 3.29, 1.22)

#What kind of data is in a variable
class(things)
class(things2)
class(x)

matrixOne <- cbind(things, things2)
class(matrixOne)

df <- as.data.frame(cbind(things, things2))
class(df)
df$Things
sum(as.numeric(df$things2))

table1(~., mtcars)

 class(mtcars)
names(mtcars)
mean(mtcars$mpg)

#Change
head(mtcars)


