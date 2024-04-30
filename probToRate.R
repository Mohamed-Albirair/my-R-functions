#------------------------------------------------------------------------------#
# Epi Conversions
#
# Author: Albirair
# Last edited: Apr 30th, 2024
#------------------------------------------------------------------------------#

# Convert from probability to rate
# https://www.hsrd.research.va.gov/for_researchers/cyber_seminars/archives/2401-notes.pdf
probToRate <- function(time, prob){
      -log(1 - prob) / time
}
