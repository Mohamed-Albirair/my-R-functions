#------------------------------------------------------------------------------#
# EDA R Functions
#
# Author: Mohamed Albirair
# Last edited: May 1st, 2024
#------------------------------------------------------------------------------#

# A function to estimate absolute predicted values with confidence levels

#' @param model The regression model of interest.
#' @param parms A character variable for defining the desired parameters for 
#'  calculating the absolute fitted values.
#' @param n_digits A numeric variable indicating the number of digits in the 
#'  output table.

calcAbsFitValue <- function(model, parms, n_digits = 3) {
      as.data.frame(
            car::deltaMethod(model,
                             g.    = parms,
                             vcov. = vcov(model))) %>%
            select(1, LCL = 3, UCL = 4) %>%
            mutate(across(everything(), ~ round(exp(.), n_digits)))
}
