#' @title A Function to Produce Scrollable Tables in Knitted-to-HTML Files
#' @author Mohamed Albirair, PhD + Stackoverflow [link](https://stackoverflow.com/questions/45849433/horizontal-scrolling-in-rmarkdown)
#' @param df Dataframe object
#' @param h_inpt Input for the table height window


scrollable <- function(df, h_inpt = "600px") {
      # https://stackoverflow.com/questions/45849433/horizontal-scrolling-in-rmarkdown
      df %>% kableExtra::kable(format = "html") %>% 
            kableExtra::kable_styling("striped") %>% 
            kableExtra::scroll_box(height = h_inpt)
}