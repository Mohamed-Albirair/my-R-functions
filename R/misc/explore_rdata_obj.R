#' @title Explore Objects Contained within an *.RData file
#' @author Mohamed Albirair, MBBS, MPH, PhD
#' @param file_path Location where the .RData file is stored
#' @param obj_nm Name of target object within the .RData file


explore_rdata_obj <- function(file_path,
                              obj_nm = NULL) {
      
      temp_env <- new.env()
      
      obj_vec <- load(file  = file_path,
                      envir = temp_env)
      
      if (!is.null(obj_nm)) {
            present <- obj_nm %in% obj_vec
            
            if (present) {
                  trgt_obj <- get(x = obj_nm,
                                  envir = temp_env)
                  
                  return(trgt_obj)
                  
            } else {
                  stop("Inputted object is not present within .RData file")
            }
            
      } else {
            return(obj_vec)
            
      }
      
      
      
}
