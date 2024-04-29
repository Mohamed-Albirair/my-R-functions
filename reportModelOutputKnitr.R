# A function for producing publication-quality model outputs:
reportModelOutputKnitr <- function(model,
                                   exp = c(TRUE, FALSE),
                                   n_digits = 3,
                                   caption_input = "") {
      if(length(exp) > 1){
            stop("Specify input to exp argument: TRUE/FALSE")
      }
      model %>% broom.mixed::tidy(exponentiate = exp,
                                  conf.int = TRUE,
                                  effects = "fixed") %>%
            dplyr::select(term, estimate, conf.low, conf.high, p.value) %>%
            mutate(across(last_col(), ~ ifelse(. < 0.001, "<0.001", round(., 3)))) %>%
            knitr::kable(digits    = c(0, rep(n_digits, 3), 0),
                         booktabs  = TRUE,
                         caption   = caption_input,
                         col.names = c("Coefficient", "Estimate", "95% LCL", "95% UCL", "p-value")) %>%
            kableExtra::kable_styling(latex_options = "striped") %>%
            kableExtra::kable_styling(latex_options = "HOLD_position")
}
