#------------------------------------------------------------------------------#
# Mathematical Modeling
#
# Author: Mohamed Albirair
# Last edited: July 28th, 2025
#------------------------------------------------------------------------------#

#' @title A function to convert transition probabilities across different time units

#' @param ratio A numeric value indicating the ratio between the desired time
#'  unit and the default time unit (e.g., when converting from annual to 
#'  monthly, ratio = 1/12).
#' @param tp A numeric value indicating the value of the known transition
#'  probability over the default time unit.

conv_trans_prob <- function(tp, ratio) {
      1 - (1 - tp) ^ ratio
}
