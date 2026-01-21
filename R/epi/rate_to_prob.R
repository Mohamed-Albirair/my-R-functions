#------------------------------------------------------------------------------#
# Epi Conversions
#
# Author: Albirair
# Last edited: Apr 30th, 2024
#------------------------------------------------------------------------------#

# Convert from rate to probability
# https://www.hsrd.research.va.gov/for_researchers/cyber_seminars/archives/2401-notes.pdf
rate_to_prob <- function(time, rate){
      1 - exp(-time * rate)
}
