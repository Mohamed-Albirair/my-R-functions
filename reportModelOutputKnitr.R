#------------------------------------------------------------------------------#
# EDA R Functions
#
# Author: Mohamed Albirair
# Last edited: May 1st, 2024
#------------------------------------------------------------------------------#

#' @title A function for producing publication-quality regression model outputs
#' @author Mohamed Albirair
#' @param model The regression model of interest.
#' @param exp A logical input, indicating whether to exponentiate coefficients
#'  or not. Applies when the model is linear `(FALSE)` or non-linear `(TRUE)`.
#' @param parms A character vector for renaming covariates in the regression
#'  model output. If not input is provided, it defaults to how R names them.
#' @param digits A numeric input for determining the number of digits show in
#'  the regression model output.
#' @param caption_input A character variable for naming the regression model 
#'  output table.
#' @return The function yields 3 outputs:
#'         1. A Knitr::kable output.
#'         2. A raw output for furthe extraction; and
#'         3. Exponentiated ceofficient values in % for easier interpretation.

reportModelOutputKnitr <- function(model,
                                   exp           = c(TRUE, FALSE),
                                   parms         = names(coef(model)),
                                   n_digits      = 3,
                                   caption_input = "",
                                   print_output  = TRUE
                                   ) {
      if(length(exp) > 1){
            stop("Specify input to exp argument: TRUE/FALSE")
      }
      
      modelOutput <- model %>% 
            broom.mixed::tidy(exponentiate = exp,
                              conf.int     = TRUE,
                              effects      = "fixed") %>% 
            dplyr::select(term, estimate, conf.low, conf.high, p.value) %>%
            dplyr::mutate(dplyr::across(term, ~ parms),
                   across(tidyselect::last_col(), ~ ifelse(. < 0.001, "<0.001", round(., 3))))
      
      # Interpretations
      if(exp == TRUE){
            interpretCoef <- modelOutput %>% 
                  dplyr::select(estimate) %>% 
                  dplyr::mutate(estimate = 
                                      case_when(row_number() == 1 ~ 
                                                      scales::label_percent(big.mark = ",")(round(estimate - 1, 3)),
                                                row_number() != 1 & estimate > 1 ~ 
                                                      scales::label_percent(big.mark = ",")(round(estimate - 1, 3)),
                                                row_number() != 1 & estimate < 1 ~
                                                      scales::label_percent(big.mark = ",")(1 - round(estimate, 3)),
                                                row_number() != 1 & estimate == 1 ~ "No effect!")) %>% 
                  dplyr::pull()
      }
      
      # Knitting
      if(print_output == TRUE){
            modelOutput %>%
                  knitr::kable(digits    = c(0, rep(n_digits, 3), 0),
                               booktabs  = TRUE,
                               caption   = caption_input,
                               col.names = c("Parameter", "Coefficient", "95% LCL", "95% UCL", "p-value")) %>%
                  kableExtra::kable_styling(latex_options = c("striped", "HOLD_position")) %>%
                  print()
      }
      
      # Save all outputs
      outputs <- list(modelOutput   = modelOutput,
                      interpretCoef = interpretCoef)
}
