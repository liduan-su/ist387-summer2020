# Run these three functions to get a clean test of homework code
dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

library(readr)
library(quanteda)

setwd("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/practice/breakout/") # Change to the folder containing your homework data files

#Pt. 1
#1
tweetDF <- read_csv("ClimatePosts.csv")
str(tweetDF)
View(tweetDF)
# This dataset contain three variable. 
# the first one is ID, it seems like the tweet @username
# the second one is whether it is skeptic or not, 0 is false, 1 is true.
# the third one is the tweet itself.

#2
tweetCorpus <- corpus(tweetDF$Tweet, docnames=tweetDF$ID)
#this cut out all the tweet to a line.

#3
tweetDFM <- dfm(tweetCorpus, remove_punct=TRUE,
                remove=stopwords("english"), )
#cleanse the dataset

#4
tweetDFM
# we are looking at 18 documents(tweets) with 223 features(words), at sparse of 93.2%

#5
textplot_wordcloud(tweetDFM, min_count = 1)
# the climate are the most noticeable one here in this wordcloud
# i have looking at things like global climate chage are pretty obvious. 

#6
m <- as.matrix(tweetDFM)
postCounts <- rowSums(m)
tweetDF$postCounts <- postCounts
boxplot(postCounts ~ Skeptic, data=tweetDF)

#Pt. 2
#7
# I use the file from http://www.cs.uic.edu/~liub/FBS/opinion-lexicon-English.rar, the header of the document are 29 lines long and 30 lines accordingly. total word count are the same.
posWords <- scan("positive-words.txt", character(0), sep = "\n")
posWords <- posWords[-1:-29] 

negWords <- scan("negative-words.txt", character(0), sep = "\n")
negWords <- negWords [-1:-30]

#8
wordCounts <- colSums(m)
wordCounts <- sort(wordCounts, decreasing=TRUE)

#9
str(wordCounts)
head(wordCounts)
# Compared wordCounts with our wordCloud, we can see the higher number shown in wordCounts, the larger that word shown in the wordCloud. 


#10
matchedP <- match(names(wordCounts), posWords, nomatch = 0)

#11
matchedP
pCounts <- wordCounts[which(matchedP != 0)]
sum(pCounts)
# 14 Positive words are matched here.


#12
matchedN <- match(names(wordCounts), negWords, nomatch = 0)
nCounts <- wordCounts[which(matchedN != 0)]
sum(nCounts)
# 21 Negative words are matched here.