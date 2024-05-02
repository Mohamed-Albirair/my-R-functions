#------------------------------------------------------------------------------#
# EDA R Functions
#
# Author: Mohamed Albirair
# Last edited: May 1st, 2024
#------------------------------------------------------------------------------#

# A function for producing publication-quality model outputs:
#'
#' @param model The regression model of interest.
#' @param exp A logical input, indicating whether to exponentiate coefficients
#'  or not. Applies when the model is linear `(FALSE)` or non-linear `(TRUE)`.
#' @param parms A character vector for renaming covariates in the regression
#'  model output. If not input is provided, it defaults to how R names them.
#' @param digits A numeric input for determining the number of digits show in
#'  the regression model output.
#' @param caption_input A character variable for naming the regression model 
#'  output table.

reportModelOutputKnitr <- function(model,
                                   exp = c(TRUE, FALSE),
                                   parms = names(coef(model)),
                                   n_digits = 3,
                                   caption_input = "") {
      if(length(exp) > 1){
            stop("Specify input to exp argument: TRUE/FALSE")
      }
      
      model %>% broom.mixed::tidy(exponentiate = exp,
                                  conf.int = TRUE,
                                  effects = "fixed") %>%
            dplyr::select(term, estimate, conf.low, conf.high, p.value) %>%
            mutate(across(last_col(), ~ ifelse(. < 0.001, "<0.001", round(., 3))),
                   across(term, ~ parms)) %>% 
            knitr::kable(digits    = c(0, rep(n_digits, 3), 0),
                         booktabs  = TRUE,
                         caption   = caption_input,
                         col.names = c("Parameter", "Coefficient", "95% LCL", "95% UCL", "p-value")) %>%
            kableExtra::kable_styling(latex_options = "striped") %>%
            kableExtra::kable_styling(latex_options = "HOLD_position")
}
