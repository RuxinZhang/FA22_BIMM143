# EXTRA CREDIT LAB 4
source("http://thegrantlab.org/misc/cdc.R")

View(cdc)
head(cdc$genhlth)

tail(cdc$smoke100, 20)

plot(cdc$height,cdc$weight,
     main="Height Vs. Weight",
     xlab="Height (inches)",
     ylab="Weight (pounds)")

cor(cdc$weight, cdc$height)

hist(cdc$height)
hist(cdc$weight)

# create height.m

height_m <- cdc$height * .0254
weight_kg <- cdc$weight * .453592

BMI <- (weight_kg)/(height_m^2)

plot(cdc$height, BMI,
     main="Height Vs. BMI",
     xlab="Height (m)",
     ylab="BMI (kg/m)")

cor(cdc$height, BMI)

# Note that I only have patience to print out the first 100 entries here
head(BMI >= 30, 100)

sum(BMI >= 30)

length(BMI)

plot(cdc[1:100,]$height,cdc[1:100,]$weight,
     main="Height Vs. Weight",
     sub = "from the first 100 respondents",
     xlab="Height (inches)",
     ylab="Weight (pounds)")

table(cdc$gender)
cdc$gender[(BMI >= 30)]
length(cdc$gender[(BMI >= 30)])

table(cdc$gender[(BMI >= 30)])


# LE4

test1 <- c("CHIHYING", "SHUAIZE", "RUNQI", "YI", "RENNY")
test2 <- c(TRUE, TRUE, FALSE, FALSE, TRUE)

test1[test2]

# test names() function

age <- c(40, 30, 20, 20, 25)
names(age) <- test1

df <- data.frame(age, test1)
df$age


test3 <- c("CHIHYING", "SHUAIZE", "RUNQI", "YI", "RENNY")
test4 <- c(T, T, F, F, T)

test3[test4]


test5 <- c("CHIHYING", "SHUAIZE", "RUNQI", "YI", "RENNY")
test6 <- c(1, 1, 0, 0, 1)
test5[test6]

table(df)

df <- data.frame(num=1:5, char=letters[1:5], logic=c(T,T,T,F,F))

table(df)

df
df[-2]
df[-2,]

df[df$num >= 3,]

x <- 1:50
plot(x, sin(x), typ="l", col="red", lwd=30)