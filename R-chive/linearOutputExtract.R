#------------------------------------------------------------------------------#
# EDA R Functions
#
# Author: Albirair
# Last edited: Apr 30th, 2024
#------------------------------------------------------------------------------#

# Archive
linearOutputExtract <- function(mod, signifLevel = 0.05){
      data.frame(coefficients(summary(mod))[, c(1, 4)], confint(mod)) %>% 
            dplyr::select(1, 3, 4, 2) %>% round(., 3) %>% 
            `colnames<-`(c("Coefficient", "LCL", "UCL", "P-value")) %>% 
            mutate(`P-value` = case_when(`P-value` < 0.001        ~ "<0.001",
                                         `P-value` < signifLevel  ~ as.character(`P-value`),
                                         `P-value` >= signifLevel ~ as.character(`P-value`)))
}
