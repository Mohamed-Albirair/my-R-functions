# A function to estimate absolute predicted values with confidence levels
calcAbsFitValue <- function(model, parms, n_digits = 3){
      as.data.frame(
            car::deltaMethod(model,
                             g.    = parms,
                             vcov. = vcov(model))) %>%
            select(1, LCL = 3, UCL = 4) %>%
            mutate(across(everything(), ~ round(exp(.), n_digits)))
}
