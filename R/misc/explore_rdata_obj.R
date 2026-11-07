#' @title Explore and extract Objects Contained within an *.RData file
#' @author Mohamed Albirair, MBBS, MPH, PhD
#' @param file_path Location where the .RData file is stored
#' @param nm_only User-defined parameter, if only a vector of object names is desired
#' @param obj_nm Name of target object within the .RData file


explore_rdata_obj <- function(file_path,
                              nm_only = FALSE,
                              obj_nm  = NULL) {
      
      # Check if file doens't exit
      if (!file.exists(file_path)) stop("The file path provided does not exist: ", file_path)
      
      # Create an isolated temp env
      temp_env <- new.env(parent = emptyenv())
      
      # Load into an isolated environment
      obj_vec  <- load(file  = file_path,
                       envir = temp_env)
      
      # Return names early if user only wants a quick look
      if (nm_only) return(obj_vec)
      
      # Handle empty RData files
      if (length(obj_vec) == 0) {
            warning("The .RData file is empty.")
            return(NULL)
      }
      
      # If no object name is inputted, 
      # return named list of all objects inside instead of just character names
      if (is.null(obj_nm)) return(as.list(temp_env))
      
      # If inputted object name does not exist in the .RData environment:
      if (!obj_nm %in% obj_vec) {
            stop("Object '", obj_nm, "' not found in file.\n",
                 "Available objects: ", paste(obj_vec, collapse = ", "))
      }
      
      # Return target object
      trgt_obj <- temp_env[[obj_nm]]
      rm(list = setdiff(obj_vec, obj_nm), envir = temp_env)  # drop the rest
      rm(temp_env)
      gc(verbose = FALSE)
      
      trgt_obj
}
