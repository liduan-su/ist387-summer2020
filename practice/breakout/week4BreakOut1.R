# 1. Get an explanation of the contents of the built-in Nile data set using help or ? In

# your own words, what is contained in the Nile data set?

# 2. Make a copy of the Nile data set into a new object called myNile
myNile <- Nile
# 3. Review the structure of myNile.
View(myNile)
# 4. Create a time series plot of the Nile data like this: 
plot(myNile)
# 5. Create a frequency histogram of the Nile data set. In a block comment, describe
hist(myNile)
# the shape that you see. Is it a symmetric, bell-shaped (normal) curve? Is it
# skewed, with a long tail pointing to the right or left?
#left
# 6. Find out the length of the Nile data.
length(myNile)
# 7. Calculate how many different ways there are to sample 10 observations from the
# Nile data. Here’s some code that will do the job:
# n <- length(myNile) # Number of items in the set to be sampled
# r <- 10 # Number of observations to include in each sample
# factorial(n) / factorial(n - r) # Ordered samples without replacement
# n ^ r # Ordered samples with replacement

sample(myNile, size = 10, replace = TRUE)