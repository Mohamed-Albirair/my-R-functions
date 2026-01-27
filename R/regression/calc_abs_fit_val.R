#' @title A function to estimate absolute predicted values with confidence levels
#' @author Mohamed Albirair, MBBS, MPH, PhD
#' @param model The regression model of interest.
#' @param params A character variable for defining the desired parameters for calculating the absolute fitted values.
#' @param exp A logical variable to indicate whether coefficients are to be exponentiated or not
#' @param n_digits A numeric variable indicating the number of digits in the output table.

calc_abs_fit_val <- function(model,
                             params,
                             exp      = c(TRUE, FALSE),
                             n_digits = 3) {
      
      # Check
      if (is.null(model) | is.null(params)) {
            stop("Model and/or parameter values need to be specified for the function to run.")
      }
      
      as.data.frame(car::deltaMethod(model,
                                     g.    = params,
                                     vcov. = vcov(model))) %>%
            dplyr::select(1, LCL = 3, UCL = 4) %>% 
            magrittr::set_rownames("Effect") %>% 
            
            if (exp == TRUE) {
                  dplyr::mutate(dplyr::across(.cols = tidyselect::everything(),
                                              .fns  = ~ round(exp(.), n_digits)))
                  
            } else {
                  dplyr::mutate(dplyr::across(.cols = tidyselect::everything(),
                                              .fns  = ~ round(., n_digits)))
            }
}
