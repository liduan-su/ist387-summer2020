library(ggplot2)

mtc <- mtcars

hist(mtc$mpg, breaks=4)
g <- ggplot(mtc,aes(x=mpg))+geom_histogram(bins=5, color="black", fill="white")
g
g <- ggplot(mtc,aes(x=mpg))+geom_histogram(binwidth=5, color="black", fill="white")
g
g + ggtitle("mpg buckets") 

ggplot(mtc, aes(x=factor(0), mpg)) + geom_boxplot()
ggplot(mtc, aes(group=cyl, x=cyl , mpg)) + geom_boxplot()
ggplot(mtc, aes(group=cyl, x=cyl , mpg)) + geom_boxplot() + coord_flip()

ggplot(mtc, aes(x=cyl)) + geom_bar()
hist(mtc$cyl)

car.names <- rownames(mtc)

g<-ggplot(mtc, aes(x=car.names, y=wt)) + geom_bar(stat = "identity")
g
g <- g + theme(axis.text.x = element_text(angle=90, hjust = 1))
g
g+ggtitle("my car weight chart")

ggplot(mtc, aes(x=cyl, fill=factor(gear))) + geom_bar()
ggplot(mtc, aes(x=cyl, fill=factor(gear))) + geom_bar(position = 'dodge')


ggplot(mtc, aes(x=mpg, y=wt)) + geom_point()
ggplot(mtc, aes(x=mpg, y=wt)) + geom_point(aes(size=qsec))
ggplot(mtc, aes(x=mpg, y=wt)) + geom_point(aes(size=qsec, color=qsec))
ggplot(mtc, aes(x=mpg, y=wt)) + geom_point(aes(size=qsec, color=qsec)) + geom_text(aes(label=car.names), size=3)


ggplot(mtc, aes(x=mpg, y=car.names))+geom_point(size=3)
ggplot(mtc, aes(x=mpg, y=reorder(car.names, mpg)))+geom_point(size=3)

       