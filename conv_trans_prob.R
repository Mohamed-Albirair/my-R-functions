conv_trans_prob <- function(ratio, tpa){
      tpb = 1 - (1 - tpa) ^ ratio
      return(tpb)
}
