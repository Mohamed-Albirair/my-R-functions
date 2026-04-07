# https://github.com/tidyverse/ggplot2/issues/5694

get_children <- function(name, lut) {
      children <- lut[names(lut) == name]
      if (length(children) == 0) {
            return(name)
      }
      lapply(children, get_children, lut = lut)
}

theme_recursive <- function(..., tree = get_element_tree()) {
      
      # Make lookup table
      lut <- lapply(tree, `[[`, i = "inherit")
      lut <- lut[lengths(lut) > 0] # Skip orphans
      lut <- stats::setNames(
            rep(names(lut), lengths(lut)),
            unlist(lut)
      )
      
      theme <- theme(...)
      
      for (element in names(theme)) {
            children <- unlist(get_children(element, lut), recursive = TRUE)
            theme[children] <- theme[element]
      }
      
      theme
}
