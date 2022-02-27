ddscale <- function(control, treatment){
      n <- length(control) 
      control.scaled <- (control - mean(control[1:(n-1)])) / (sd(control[1:(n-1)]))
      treatment.hyp <- (control.scaled * (sd(treatment[1:(n-1)]) / sd(control.scaled[1:(n-1)])) + (mean(treatment[1:(n-1)]) - mean(control.scaled[1:(n-1)])))
      treatment.hyp
}