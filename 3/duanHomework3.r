################################################

# IST387, Standard Homework Heading

#

# Student name: Liwen Duan 

# Homework number: 3

# Date due: 2020/06/07

#

# Attribution statement: (choose only one)

# 1. I did this homework by myself, with help from the book and the professor

# Run these three functions to get a clean test of homework code

#dev.off() # Clear the graph window

cat('\014')  # Clear the console

rm(list=ls()) # Clear user objects from the environment


# Set working directory 

#setwd("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/3/") 

# Your homework specific code goes below here

#Step 1: Use read_csv( ) to read a CSV file from the web into a data frame:
  library('readr')
  dfStates <- read_csv("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/3/states.csv")

#Step 2: Create a new data frame that only contains states with Twitter URLs:
  #B. Use View( ), head( ), and tail ( ) to examine the dfStates data frame. Add a block comment that briefly describes what you see.
  View(dfStates)
  #The table contain information about US states, it include data like state population, whether it have twitter and facebook, etc...

  #C. Create a selector variable that has TRUE if a state is missing its Twitter URL:
  noTwitter <- is.na(dfStates$twitter_url)

  #D. Use the table( ) command to summarize the contents of noTwitter. Write a comment interpreting what you see.
  table(noTwitter)
  #I see the count on the state which has twitter or not. 15 states don't have twitter, 35 states does.

  #E. Create a new data frame that contains only the states with Twitter URLs:
  twitterStates <- dfStates[!noTwitter, ]

  #F. Use the dim( ) command on twitterStates to confirm that the data frame contained 35 observations and 19 columns/variables.
  dim(twitterStates)
  
# Step 3: Calculate the mean for each of the three numeric variables.
  # G. The data frame contains three numeric variables. You can remind yourself of what they are by looking at the output of str(twitterStates). Calculate the mean for each of the numeric variables.
  str(twitterStates)
  mean(twitterStates$population)
  mean(twitterStates$population_rank)
  mean(twitterStates$admission_number)

  # H. Write a comment, noting the mean population for twitterStates.
  #[1] 6532234

  # Expert Mode!!! Create another data frame containing the 15 states that do not have Twitter URLs. Find out the mean population of those 15 states. Compare that to the answer you recorded for problem H.
    noTwitterStates <- dfStates[noTwitter, ]
    mean(noTwitterStates$population)    
  # [1] 5790280
  #States which have a twitter account have higher population.

# Step 4: Extract the Twitter handle from the URL.
  # I. Use the gsub() command to remove the beginning part of the URL from the Twitter URLs. This command should work most of the time:
    gsub("https://twitter.com/","", twitterStates$twitter_url)
  
  # J. Take a close look at the output from the gsub( ) command in problem I. Explain the cause of the incorrect results in a comment.
 
  #some state's twitter URL are start with 'http', Some states' twitter url start with 'http://www.twitter,com/', and PA fill the facebook URL to twitter one.

  # K. Assign the results of the gsub( ) command to a new variable on the data frame. Note that you do not have to repair the problems that you explained in problem J:
    twitterStates$handle <- gsub("https://twitter.com/","", twitterStates$twitter_url)

# Step 5: Create a function to extract Twitter handles:
  # L. The following function should work most of the time. Make sure to run this code before trying to test it. That is how you make the new function known to R. Add comments to each line explaining what it does:
    
    getTwitterHandleFromURL <- function(URL) {
      #create function, input argument is URL
      fixTry1 <- gsub("https://twitter.com/","", URL)
      #first argument 'fixTry1', feed in URL, run code gsub to replace url start with 'https://twitter.com/'
      fixTry2 <- gsub("http://twitter.com/","", fixTry1)
      #second argument 'fixTry2', feed vector 'fixTry1', run code gsub to replace url start with 'http://twitter.com/'
      fixTry3 <- gsub("http://www.twitter.com/","", fixTry2)
      return(fixTry3)
      #Third argument 'fixTry3', feed vector 'fixTry2', run code gsub to replace url start with 'http://www.twitter.com/'
    }
  
  # M. Run your new function on the Twitter URLs. Make sure to use a comment to explain the cause of any problems that remain unfixed:
    getTwitterHandleFromURL(twitterStates$twitter_url)
  #PA fill the data wrong, they fill the facebook page into twitter_url field...

  # N. Assign the results of problem M to a variable on the data frame:
    twitterStates$handle <- getTwitterHandleFromURL(twitterStates$twitter_url)
  
  # Expert Mode!!! Write a comment in your code that briefly describes an applied project where you could use the data frames and variables you just created.
  
  #Project may use the extracted twitter handle data from this dataset to observe how government may use the social media to marketing their state. See relationship between a higher population and a successful state twitter account.