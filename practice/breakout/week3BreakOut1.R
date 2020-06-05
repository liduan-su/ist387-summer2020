help("state.x77")
dfStates77 <- state.x77
summary(dfStates77)
totalPop77 <- sum(dfStates77[,"Population"]) #[1] 212321
library(readr)
dfStates17 <- read_csv("C:/Users/Sam_D/OneDrive - Syracuse University/Course/2-Sophomore/Summer 2020/IST 387/homework/3/states.csv")
summary(dfStates17)
totalPop17 <- sum(dfStates17[,"population"]) #[1] 315482390
totalPop17/(totalPop77 *100)