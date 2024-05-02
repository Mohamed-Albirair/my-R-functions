#------------------------------------------------------------------------------#
# Mathematical Modeling
#
# Author: Mohamed Albirair
# Last edited: May 1st, 2024
#------------------------------------------------------------------------------#

# A function to calcate transition probabilities for different time units

#' @param ratio A numeric value indicating the ratio between the desired time
#'  unit and the default time unit (e.g., when converting from annual to 
#'  monthly, ratio = 1/12).
#' @param transProb A numeric value indicating the value of the known 
#'  probability over the default time unit.

convTransProb <- function(oldTP, ratio){
      1 - (1 - transProb) ^ ratio
}
