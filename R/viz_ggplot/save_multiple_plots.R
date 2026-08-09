#' @title Save multiple plots using `ggsave`
#' @author Gemini (edited)

save_multiple_plots <- function(plot_list,
                                file_loc,
                                plot_name   = names(plot_list),
                                extension   = ".png",
                                width_inpt  = 900,
                                height_inpt = 600,
                                units_inpt  = "px",
                                dpi_inpt    = 300,
                                verbos      = TRUE) {
      
      mapply(
            FUN  = function(plot, name, idx) {
                  if (verbos) {
                        message("Saving plot ", idx, " of ", length(plot_list), ": ", name)
                  }
                  
                  ggsave(filename = paste0(file_loc, name, extension),
                         plot     = plot,
                         width    = width_inpt,
                         height   = height_inpt,
                         units    = units_inpt,
                         dpi      = dpi_inpt)
            },
            plot     = plot_list,
            name     = plot_name,
            idx      = seq_along(plot_list),
            SIMPLIFY = FALSE
      )
}
