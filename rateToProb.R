# Convert from rate to probability
# https://www.hsrd.research.va.gov/for_researchers/cyber_seminars/archives/2401-notes.pdf
rateToProb <- function(time, rate){
      1 - exp(-time * rate)
}
