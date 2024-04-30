#------------------------------------------------------------------------------#
# EDA R Functions
#
# Author: Albirair
# Last edited: Apr 30th, 2024
#------------------------------------------------------------------------------#

# A simple function to extract predicted values and 95% CIs:
calcFittedValues <- function(mod, data){
      data %>% mutate(
            fitted_val = predict(mod, type = "response", newdata = .),
            fitted_se  = predict(mod, type = "link", se.fit = TRUE,
                                 newdata = .)$se.fit,
            fitted_lcl = exp(log(fitted_val) - qnorm(0.975) * fitted_se),
            fitted_ucl = exp(log(fitted_val) + qnorm(0.975) * fitted_se)
      )
}
