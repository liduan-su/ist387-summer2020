################################################

# IST387, Standard Homework Heading
#
# Student name: Liwen Duan 
# Homework number: 11
# Date due: 2020/8/2
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

# Run these three functions to get a clean test of homework code
#dev.off() # Clear the graph window
cat('\014')  # Clear the console
rm(list=ls()) # Clear user objects from the environment

# Set working directory 
setwd("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/11/") # Change to the folder containing your homework data files

# Your homework specific code goes below here

#################################################

library(quanteda)

#A
charVector <- scan("TheRoadNotTaken.txt", character(0), sep = "\n")
#B
frostCorpus <- corpus(charVector) # Convert to a corpus
# Now convert the corpus to a document-feature matrix
frostDFM <- dfm(frostCorpus, remove_punct=TRUE,
                remove=stopwords("english"), )
#C
textplot_wordcloud(frostDFM, min_count = 1)

#Pt.2
#D
m <- as.matrix(frostDFM)
wordCounts <- colSums(m)
wordCounts <- sort(wordCounts, decreasing=TRUE)
wordCounts

#E
# The wordCounts contain the frequency of a word are shown in the source dataframe.
# From the word counts we can learn that word 'one' appeared the most, three times. which is matched with word cloud.
# Many words only appeared once.


#Pt.3
#F
posWords <- scan("positive-words.txt", character(0), sep = "\n")
posWords <- posWords[-1:-34]
negWords <- scan("negative-words.txt", character(0), sep = "\n")
negWords <- negWords[-1:-34]

#G
matchedP <- match(names(wordCounts), posWords, nomatch = 0)
matchedN <- match(names(wordCounts), negWords, nomatch = 0)
# This line of code is to match each word in wordCounts with negWords Vector. 
# Fill the position with a location in negWords of that words.
# If matched return that location in negWords, is no match then fill it with 0.

#H
pWords <- wordCounts[which(matchedP != 0)]
pWords

#I
nWords <- wordCounts[which(matchedN  != 0)]
nWords

#J
# From the result we know the word that are matched. In positive words we have 'fair', 'better' and 'leads',
# In negative words we have 'sorry', 'bent' and 'worn'. All of those word are appeared once only.
