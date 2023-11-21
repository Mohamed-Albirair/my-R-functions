# A manual R function for extracting regression model parameters:
modOutput <- function(mod, exp, cols = c(1:2, 5:6, 9)){
      mod %>% parameters::parameters(., exponentiate = exp) %>%
            as.data.frame() %>% # to allow further wrangling
            dplyr::select(cols) %>% # select desired columns in the desired order
            mutate(across(2:4, ~ ifelse(abs(.) < 0.001, scales::scientific(.), round(., 3))),
                   across(last_col(), ~ ifelse(. < 0.001, "<0.001", round(., 3)))) %>%
            magrittr::set_colnames(c("Parameter", "Coefficient", "LCL", "UCL", "P-value"))
}
