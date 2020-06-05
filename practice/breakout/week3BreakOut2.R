popDensity <- function(pop, area){
    fixedPop <- pop * 1000
    popDens <- fixedPop / area
    return(popDens)
}
dfStates77 <- state.x77
tempPop <- dfStates77[,"Population"]
tempArea <- dfStates77[,"Area"]
pdList <- popDensity(tempPop,tempArea)
str(pdList)
which.max(pdList)
which.min(pdList)