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
#' @param params A character vector for renaming covariates in the regression
#'  model output. If not input is provided, it defaults to how R names them.
#' @param digits A numeric input for determining the number of digits show in
#'  the regression model output.
#' @param caption_input A character variable for naming the regression model 
#'  output table.
#' @return The function yields 3 outputs:
#'         1. A Knitr::kable output (with @param knitr_output = TRUE)
#'         2. A raw output for further extraction (call: `$mod_out`); and
#'         3. Exponentiated coefficient values in % for easier interpretation 
#'            (call: `$interpret_coef`).

report_mod_out_knitr <- function(model,
                                 exp           = c(TRUE, FALSE),
                                 params        = names(coef(model)),
                                 n_digits      = 3,
                                 caption_input = "",
                                 knitr_output  = c(TRUE, FALSE)) {
      
      if (length(exp) > 1) {
            stop("Specify input to exp argument: TRUE/FALSE")
      }
      
      mod_out <- model %>% 
            broom.mixed::tidy(exponentiate = exp,
                              conf.int     = TRUE,
                              effects      = "fixed") %>% 
            dplyr::select(term, estimate, lcl = conf.low, ucl = conf.high, p_val = p.value) %>%
            dplyr::mutate(dplyr::across(term, ~ params),
                          dplyr::across(
                                      tidyselect::last_col(), ~ as.character(
                                            ifelse(. < 0.001, "<0.001", round(., 3))
                                            )
                                      )
                          )
      
      # Interpretations
      if (exp == TRUE) {
            interpret_coef <- mod_out %>% 
                  dplyr::select(estimate) %>% 
                  dplyr::mutate(
                        estimate = 
                              case_when(row_number() == 1                 ~ 
                                              scales::label_percent(big.mark = ",")(round(estimate, 3)),
                                        row_number() != 1 & estimate > 1  ~ 
                                              scales::label_percent(big.mark = ",")(round(estimate - 1, 3)),
                                        row_number() != 1 & estimate < 1  ~
                                              scales::label_percent(big.mark = ",")(1 - round(estimate, 3)),
                                        row_number() != 1 & estimate == 1 ~ "No effect!")) %>% 
                  dplyr::pull()
      }
      
      # Knitting
      if (knitr_output == TRUE) {
            mod_out %>%
                  knitr::kable(digits    = c(0, rep(n_digits, 3), 0),
                               booktabs  = TRUE,
                               caption   = caption_input,
                               col.names = c("Parameter", "Coefficient", "95% LCL", "95% UCL", "p-value")) %>%
                  kableExtra::kable_styling(latex_options = c("striped", "HOLD_position")) %>%
                  print()
            
      } else {
            list(mod_out        = mod_out,
                 interpret_coef = interpret_coef)
      }
}
