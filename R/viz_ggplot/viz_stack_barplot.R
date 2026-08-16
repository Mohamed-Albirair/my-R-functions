#' @title Visualize Stacked Barplots
#' @author Mohamed Albirair, MBBS, MPH, PhD
#' @param dset Inputted data set
#' @param x_input Numerical input for x-axis
#' @param y_input Categorical input for the y-axis
#' @param fill_input Input for the fill variable
#' @param x_lab Label of x axis
#' @param lbl_col_w Levels who's label are printed in white
#' @param lbl_cutoff Cutoff of values to appear on figure
#' @param axis_scale Scale of x axis
#' @param axis_sfx Suffix of scale label
#' @param label_scale Scale of text labels
#' @param label_sfx Suffix of text label
#' @param fill_vec Vector of colors for the barplot fill
#' @param rcb_inpt RColorBrewer color set
#' @param lgnd_nrow No. of legend rows


viz_stack_barplot <- function(dset,
                              x_input,
                              y_input,
                              fill_input,
                              x_lab,
                              lbl_col_w   = 0,
                              lbl_cutoff  = 1,
                              axis_scale  = 1,
                              axis_sfx    = NULL,
                              label_scale = 1,
                              label_sfx   = NULL,
                              fill_vec    = NULL,
                              rcb_inpt    = "Set3",
                              facet_input = NULL,
                              lgnd_nrow   = 1) {

      # Required package(s)
      # https://stackoverflow.com/questions/46270860/importing-a-library-inside-a-function
      if (!require(tidyverse)) stop("tidyverse not installed!")

      # Set fill color if not defined manually
      if (is.null(fill_vec)) {
            col_name <- deparse(substitute(fill_input))
            uniq_val <- unique(dset[[col_name]])
            fill_vec <- RColorBrewer::brewer.pal(n    = length(unique(uniq_val)),
                                                 name = rcb_inpt)
      }

      # Define facet orientation based on run and adherence combinations
      facet_vars <- rlang::enquos(facet_input)  # captures bare names as quosures

      if (is.null(rlang::quo_get_expr(facet_vars[[1]]))) {
            facet <- NULL

      } else if (length(facet_vars) == 1) {
            facet <- facet_wrap(vars(!!!facet_vars))

      } else if (length(facet_vars) == 2) {
            facet <- facet_grid(rows = vars(!!facet_vars[[1]]),
                                cols = vars(!!facet_vars[[2]]))

      } else stop("Cannot have more than 2 facet variables!")


      # The visualization script-----------------------------------------------#
      dset %>%
            ggplot(aes(x    = {{x_input}},
                       y    = forcats::fct_rev({{y_input}}),
                       fill = {{fill_input}})) +
            geom_bar(stat = "identity", position = position_stack(reverse = TRUE)) +
            scale_x_continuous(name   = x_lab,
                               labels = scales::label_comma(scale = axis_scale,
                                                            suffix = axis_sfx)) +

            geom_text(aes(color = ifelse({{fill_input}} %in% c(lbl_col_w), "w", "b"),
                          label = ifelse(test = {{x_input}} >= lbl_cutoff,
                                         yes  = scales::label_comma(accuracy = 1,
                                                                    scale    = label_scale,
                                                                    suffix   = label_sfx)({{x_input}}),
                                         no   = ""),
                          group = {{fill_input}}),
                      position = position_stack(vjust = 0.5, reverse = TRUE),
                      angle = 0) +
            scale_fill_manual(values = fill_vec) +

            scale_color_manual(values = c("b" = "black", "w" = "white")) +
            facet +
            theme_caviz +
            labs(y = NULL, fill = NULL) +
            guides(color = "none",
                   fill  = guide_legend(nrow = lgnd_nrow, byrow = TRUE)) +
            theme(aspect.ratio       = NULL,
                  legend.position    = "bottom",
                  axis.text.y        = element_text(margin = margin(0, 5, 0, 0)),
                  panel.grid.major.x = element_blank(),
                  strip.background   = element_blank(),
                  strip.text.y       = element_blank(),
                  strip.placement    = "outside") # Place titles outside plot
}
