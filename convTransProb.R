convTransProb <- function(newToOldRatio, oldTP){
      newTP = 1 - (1 - oldTP) ^ ratio
      # newTP is the transition probability over time period b we wish to estimate
      # oldTP is the known probability over time period a 
      return(newTP)
}
