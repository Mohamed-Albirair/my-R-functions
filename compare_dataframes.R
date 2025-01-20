# From ChatGPT

# Load necessary libraries
library(dplyr)

# Function to compare two data frames
compare_dataframes <- function(df1, df2) {
      # Check if dimensions are the same
      if (!all(dim(df1) == dim(df2))) {
            message("Data frames have different dimensions.")
            message("Dimensions of df1: ", paste(dim(df1), collapse = " x "))
            message("Dimensions of df2: ", paste(dim(df2), collapse = " x "))
      } else {
            message("Data frames have the same dimensions: ", paste(dim(df1), collapse = " x "))
      }
      
      # Check if column names are the same
      if (!identical(names(df1), names(df2))) {
            message("Data frames have different column names.")
            message("Column names in df1: ", paste(names(df1), collapse = ", "))
            message("Column names in df2: ", paste(names(df2), collapse = ", "))
            
            # Find columns that are different
            missing_in_df1 <- setdiff(names(df2), names(df1))
            missing_in_df2 <- setdiff(names(df1), names(df2))
            
            if (length(missing_in_df1) > 0) {
                  message("Columns in df2 but not in df1: ", paste(missing_in_df1, collapse = ", "))
            }
            if (length(missing_in_df2) > 0) {
                  message("Columns in df1 but not in df2: ", paste(missing_in_df2, collapse = ", "))
            }
      } else {
            message("Data frames have the same column names.")
      }
      
      # Check for differences in data values
      diff_data <- df1 != df2
      diff_rows <- rowSums(diff_data, na.rm = TRUE) > 0
      
      if (any(diff_rows)) {
            message("Data frames have different values in the following rows:")
            differing_rows <- which(diff_rows)
            for (row in differing_rows) {
                  message("Row ", row, ":")
                  message("df1: ", paste(df1[row, ], collapse = ", "))
                  message("df2: ", paste(df2[row, ], collapse = ", "))
            }
      } else {
            message("Data frames have the same values.")
      }
      
      # Return list of differences for further inspection if needed
      list(
            diff_dimensions = !all(dim(df1) == dim(df2)),
            diff_colnames = !identical(names(df1), names(df2)),
            differing_rows = which(diff_rows),
            diff_data = df1[diff_rows, ] != df2[diff_rows, ]
      )
}

# Example usage
df1 <- data.frame(a = c(1, 2, 3), b = c("x", "y", "z"))
df2 <- data.frame(a = c(1, 2, 3), b = c("x", "y", "a"))

compare_dataframes(df1, df2)
