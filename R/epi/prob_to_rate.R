
#' @title A function to convert from probability to rate
#' @author Mohamed Albirair, PhD(c)
#' @param prob Probability value at the reference time unit.
#' @param time Ratio of target time unit to reference time unit, if converting between different time units.

#' Last edited: Apr 30th, 2024

# Citation: Gidwani R, Russell LB. Estimating Transition Probabilities from Published Evidence:
# A Tutorial for Decision Modelers. Pharmacoeconomics. 2020 Nov;38(11):1153-1164.
# doi: 10.1007/s40273-020-00937-z. Erratum in: Pharmacoeconomics. 2020 Nov;38(11):1277.
# doi: 10.1007/s40273-020-00958-8. PMID: 32797380; PMCID: PMC7426391.

prob_to_rate <- function(prob, time = 1){
      -log(1 - prob) / time
}
