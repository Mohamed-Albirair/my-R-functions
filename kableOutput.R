#------------------------------------------------------------------------------#
# EDA R Functions
#
# Author: Albirair
# Last edited: Apr 30th, 2024
#------------------------------------------------------------------------------#

# A manual function to format tables in publication quality
kableOutput <- function(output, format = "latex", caption = NULL){
      output %>% 
            kableExtra::kbl(.,
                            format   = format,
                            caption  = caption,
                            booktabs = T,
                            linesep  = "") %>% 
            kableExtra::kable_styling(full_width    = F,
                                      latex_options = "HOLD_position")
            # kableExtra::column_spec(1, bold = T)
}
