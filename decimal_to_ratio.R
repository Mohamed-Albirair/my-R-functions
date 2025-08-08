#' @title An R function that converts decimal ratios to simplified integer ratios
#' @author DeepSeek
#' @details
#' Aug 8, 2025

decimal_to_ratio <- function(decimal) {
      
      # Convert decimal to fraction
      frac <- MASS::fractions(decimal)
      
      # Extract numerator and denominator
      parts <- strsplit(attr(frac, "fracs"), "/")[[1]]
      numerator <- as.integer(parts[1])
      denominator <- ifelse(length(parts) == 2, as.integer(parts[2]), 1)
      
      # Return as "numerator:denominator" string
      paste(numerator, denominator, sep = ":")
}