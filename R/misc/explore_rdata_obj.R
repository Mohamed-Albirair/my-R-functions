#' @title Explore and extract Objects Contained within an *.RData file
#' @author Mohamed Albirair, MBBS, MPH, PhD
#' @param file_path Location where the .RData file is stored
#' @param obj_nm Name of target object within the .RData file


explore_rdata_obj <- function(file_path,
                              labs_only = FALSE,
                              obj_lab   = NULL) {
      
      # Check if file doens't exit
      if (!file.exists(file_path)) {
            stop("The file path provided does not exist: ", file_path)
      }
      
      # Create an isolated temp env
      temp_env <- new.env(parent = emptyenv())
      
      # Load into an isolated environment
      obj_vec  <- load(file  = file_path,
                       envir = temp_env)
      
      # Return names early if user only wants a quick look
      if (labs_only) return(load(obj_vec))
      
      # Handle empty RData files
      if (length(obj_vec) == 0) {
            warning("The .RData file is empty.")
            return(NULL)
      }
      
      # Return target object or list everything
      if (!is.null(obj_lab)) {
            # get0 returns NULL if not found, avoiding scoping issues
            trgt_obj <- get0(x        = obj_lab,
                             envir    = temp_env,
                             inherits = FALSE)
            
            if (!is.null(trgt_obj)) {
                  return(trgt_obj)
                  
            } else {
                  stop(
                        "Object '", obj_lab, "' not found in file.\n", 
                        "Available objects: ", paste(obj_vec, collapse = ", ")
                  )
            }
            
      # When no 'obj_lab' is inputted
      } else {
            # Return named list of all objects inside instead of just character names
            return(as.list(temp_env))
      }
}
#       
#       # Check if RData file is empty
#       if (!is.null(obj_nm)) {
#             present <- obj_nm %in% obj_vec
#             
#             # Check if target object is present
#             if (present) {
#                   trgt_obj <- get(x = obj_nm,
#                                   envir = temp_env)
#                   
#                   return(trgt_obj)
#                   
#             } else {
#                   stop("Inputted object is not present within .RData file")
#             }
#             
#       } else {
#             return(obj_vec)
#             
#       }
# 
# }
