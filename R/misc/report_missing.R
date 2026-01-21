#' @title Report Missingness Summary
#' @description
#' A function for calculating missingness summary (modified)
#' @author (Got this one from somewhere else, but lost the source! And modified it a bit!)
#' @seealso [naniar::miss_var_summary()]

report_missing <- function(df) {
      var_name <- names(df)
      obs      <- sapply(df, function(x) length(x))
      miss_n   <- sapply(df, function(x) sum(is.na(x)))
      miss_p   <- sapply(df, function(x) scales::label_percent(accuracy = 0.1)(sum(is.na(x)) / length(x)))
      report   <- cbind(var_name, obs, miss_n, miss_p)
      row.names(report)  <- NULL
      report  
}