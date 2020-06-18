
myNile <- Nile

# 1. Sample 10 observations from your copy of the Nile dataset, like this:
 nileSample <- sample(myNile, size=10)
 #, saving the results into a new variable. In a comment, record the 10 numbers you obtained.
 # [1] 1160  701  649 1020 1170  768  916  846  975 1210
# 2. Take the mean of your sample from step 1 and record the result in a comment.
mean(nileSample)
# [1] 941.5
# 3. Calculate the mean of the complete myNile data set and compare this to the
# results from item 2. In a block comment, explain what you have observed.
mean(myNile)
#[1] 919.35
#sample result seems like very similar with the original data set.
# 4. Run the replicate( ) command to repeatedly run the expression from item 2. The
# replicate( ) command takes two arguments, the number of repeats and the
# expression to repeat. Run 100 replications. Get help on the replicate( ) command
# if you need it.
replicate(100, mean(sample(myNile, size=10)))
# 5. Assign the results of running the replicate( ) command from item 4 to a new
# variable called samplingDistribution.
samplingDistribution <- replicate(100, mean(sample(myNile, size=10)))

# 6. Create a histogram of samplingDistribution.
hist(samplingDistribution)
# 7. In a block comment, explain what your sampling distribution shows.
#this histogram is skew to the right. the central is in between 900 and 950, which is the mean of the dataset. the replication of the sample is work, and it able to get similar result like the original result. 