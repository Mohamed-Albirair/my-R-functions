#' @title A function to estimate absolute predicted values with confidence levels
#' @author Mohamed Albirair
#' @param model The regression model of interest.
#' @param parms A character variable for defining the desired parameters for 
#'  calculating the absolute fitted values.
#' @param exp A logical variable to indicate whether coefficients are to be exponentiated or not
#' @param n_digits A numeric variable indicating the number of digits in the 
#'  output table.

calc_abs_effect_val <- function(model,
                                params,
                                exp = c(TRUE, FALSE),
                                n_digits = 3) {
      as.data.frame(
            car::deltaMethod(model,
                             g.    = params,
                             vcov. = vcov(model))
            ) %>%
            dplyr::select(1, LCL = 3, UCL = 4) %>% 
            magrittr::set_rownames("Effect") %>% 
            
            if (exp == TRUE) {
                  dplyr::mutate(dplyr::across(tidyselect::everything(), ~ round(exp(.), n_digits)))
                  
            } else {
                  dplyr::mutate(dplyr::across(tidyselect::everything(), ~ round(., n_digits)))
            }
}
