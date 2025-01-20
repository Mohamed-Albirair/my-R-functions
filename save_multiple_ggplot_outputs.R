# https://forum.posit.co/t/help-using-walk2-to-save-multiple-graphs/141780
figs <- list(fig_1, fig_2, fig_3, fig_4, fig_5, fig_6, fig_7, fig_8)
fig_names <- paste0("fig", "_",1:8, ".png")

walk2(figs, fig_names, ~ ggsave(plot = .x,
                                filename = .y, 
                                path = "Figures/",
                                device = "png",
                                dpi = 300))