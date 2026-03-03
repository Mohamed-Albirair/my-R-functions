#' @title Save Index data as *.RData file
#' @author Mohamed Albirair, MBBS, MPH, PhD
#' @param obj_list Object to be inputted to the .RData file
#' @param file_path User-defined path to the .RData file containing the @obj_inpt object
#' @details
#' The function assess whether target .RData file exists, and if so if it contains an identical object. If not, it creates the .RData file and/or updates it with the target object



save_rdata <- function(obj_list,
                       file_path) {

      # Get the name of the input object
      # obj_nm <- deparse(substitute(obj_inpt))
      # No need, since obj_list is already a charachter vector!
      
      # file.exists(file_path)
      if (!file.exists(file_path)) {

            # File doesn't exist, so save the object
            save(list = obj_list,
                 file = file_path)
            message("Created new .RData file")

      } else {
            
            # File exists, check if it already contains object
            # Load the file into a temporary environment to check contents
            temp_env <- new.env()
            loaded_obj_nm <- load(file  = file_path,
                                  envir = temp_env)
            
            # Classify input objects, whether present or absent in existing .RData file
            present_obj <- obj_list[obj_list %in%  loaded_obj_nm]
            absent_obj  <- obj_list[obj_list %!in% loaded_obj_nm]
            
            # Checkpoint
            if (lenght(intersect(x = present_obj,
                                 y = absent_obj)) >= 1) {
                  
                  stop("There is overlap between existing and non-existing objects!")
                  
            }
            
            if (length(present_obj) >= 1) {

                  # Get the object from the temporary environment
                  existing_obj <- mget(x     = present_obj,
                                       envir = temp_env)
                  
                  # Compare objects
                  compare_vec <- map2(.x = sort(present_obj),
                                      .y = sort(existing_obj),
                                      .f = ~ identical(.x, .y)) %>% unlist()

                  # Compare with the current object
                  if (all(compare_obj)) {
                        
                        # They are identical - skip saving
                        message("Object(s) already exists in target .RData - skipping")

                  } else if (!any(compare_obj)) {
                        
                        cgwtools::resave(list = deparse(substitute(obj_list)),
                                         file = file_path)
                        
                        # Overwrite the existing .RData file
                        message("Overwrote existing target object(s) in target .RData")
                        
                  } else {
                        
                        # Some objects (1+) don't exist in file, so add them using resave, so:
                        
                        # 1. Store a subset of target objects
                        present_obj_subset <- present_obj[compare_vec]
                        
                        # 2. Resave
                        cgwtools::resave(list = deparse(substitute(present_obj_subset)),
                                         file = file_path)
                        message("Added object to existing target .RData")
                        
                  }

            } else if (absent_obj >= 1) {
                  
                  # Object doesn't exist in file, so add it using resave
                  cgwtools::resave(list = deparse(substitute(obj_list)),
                                   file = file_path)
                  message("Added object to existing target .RData")
            }

            # Clean up temporary environment
            rm(temp_env)
      }
}
