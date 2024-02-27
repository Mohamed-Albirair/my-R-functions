# A function for calculating missingness summary
# (Got this one from somewhere, but lost the source!)
missSummary <- function(df){
      VarName           <- names(df)
      Observations      <- sapply(df, function(x) length(x))
      missCount         <- sapply(df, function(x) sum(is.na(x)))
      missPercent       <- sapply(df, function(x) paste(100 * sum(is.na(x)) / length(x), "%", sep = ""))
      outDF             <- cbind(VarName,
                                 Observations,
                                 missCount,
                                 missPercent)
      row.names(outDF)  <- NULL
      outDF  
}