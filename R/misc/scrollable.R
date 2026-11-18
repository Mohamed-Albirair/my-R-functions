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


# A faster version for larger datasets
scrollable_DT <- function(x,
                          ht_inpt  = "400px",
                          dgt_inpt = z$n_decimals) {
      dt <- DT::datatable(data          =  x,
                          fillContainer = FALSE,
                          options       = list(pageLength = 10,
                                               scrollX    = TRUE,
                                               scrollY    = ht_inpt))
      
      # Identify numeric columns and format them to 5 decimal places
      numeric_cols <- which(sapply(x, is.numeric))
      dt <- DT::formatRound(dt, columns = numeric_cols, digits = dgt_inpt)
}