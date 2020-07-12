x <- c(1:10)
y <- c(1:10)
m <- lm(formula = y ~ x, data = df)
summary(m)
abline(m)


x <- c(1,2,3,4,5)
y <- c(0.2,2.2,3.8,4.9,5.1)
df <- data.frame(x, y)
plot(df$x, df$y)
m1 <- lm(formula = y ~ x, data = df)
summary(m1)
abline(m1)

library(ggplot2)
g <- ggplot(df, aes(x = x, y = y)) + geom_point()
g
g + stat_smooth(method = "lm", col = "red")

w <- c(1,3,4,4.5,5,6.1,7.3,7.9,9.2,10.05)
df <- data.frame(x,y,w)
plot(df$x, df$w)
m1 <- lm(formula = w ~ x, data = df)
summary(m1)
abline(m1)

g <- ggplot(df, aes(x = x, y = w)) + geom_point() + stat_smooth(method = "lm", col = "red")
g                                                                

x <- sample(1:100, 10, replace = FALSE)
y <- sample(1:100, 10, replace = FALSE)
df <- data.frame(x, y)
plot(df$x, df$y)
m1 <- lm(formula = y ~ x, data = df)
summary(m1)
abline(m1)
g <- ggplot(df, aes(x = x, y = y)) + geom_point() + stat_smooth(method = "lm", col = "red")
g

####################
mpg.lm = lm(formula = mpg ~ wt, data=mtcars)
summary(mpg.lm)

mpg.lm = lm(formula = mpg ~ hp, data=mtcars)
summary(mpg.lm)

mpg.lm = lm(formula = mpg ~ wt+hp, data=mtcars)
summary(mpg.lm)

mpg.lm = lm(formula = mpg ~ wt+hp+cyk, data=mtcars)
summary(mpg.lm)

mpg.lm = lm(formula = mpg ~ ., data=mtcars)
summary(mpg.lm)

mpg.lm = lm(formula = mpg ~ wt+cyl, data=mtcars)
summary(mpg.lm)


range(mtcars$wt)
newdata = data.frame(cyl=4, wt=2.8)
predict(mpg.lm, newdata, type = "response")

#see how good the model is
# pvalue < 0.05?
# how much does model explain
sum.model <- summary(mpg.lm)
paste("p.values: ")
sum.model$coef[,4]
paste("adjusted r squared: ", sum.model$adj.r.squared)


#full model
mpg.lm = lm(formula = mpg ~ hp+wt, data = mtcars)

g <- ggplot(mtcars, aes(x=hp, y=wt)) + geom_point(aes(size=mpg, color = mpg)) + geom_smooth(method = "lm")
g
