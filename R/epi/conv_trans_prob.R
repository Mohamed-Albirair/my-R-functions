
#' @title A function to convert transition probabilities across different time units
#' @author Mohamed Albirair, PhD(c)
#' @param ratio A numeric value indicating the ratio between the desired time unit and the default time unit (e.g., when converting from annual to monthly, ratio = 1/12).
#' @param tp A numeric value indicating the value of the known transition probability over the default time unit.
#' Last edited: July 28th, 2025

# Citation: Gidwani R, Russell LB. Estimating Transition Probabilities from Published Evidence:
# A Tutorial for Decision Modelers. Pharmacoeconomics. 2020 Nov;38(11):1153-1164.
# doi: 10.1007/s40273-020-00937-z. Erratum in: Pharmacoeconomics. 2020 Nov;38(11):1277.
# doi: 10.1007/s40273-020-00958-8. PMID: 32797380; PMCID: PMC7426391.

conv_trans_prob <- function(tp, ratio) {
      1 - (1 - tp) ^ ratio
}
