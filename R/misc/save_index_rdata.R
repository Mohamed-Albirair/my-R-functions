#' @title Save Index data as *.RData file
#' @author Mohamed Albirair, MBBS, MPH, PhD
#' @param obj_inpt Object to be inputted to the .RData file
#' @param file_path User-defined path to the .RData file containing the @obj_inpt object
#' @details
#' The function assess whether target .RData file exists, and if so if it contains an identical object. If not, it creates the .RData file and/or updates it with the target object



save_index_rdata <- function(obj_inpt,
                             file_path) {

      # Get the name of the input object
      obj_name <- deparse(substitute(obj_inpt))


      if (!file.exists(file_path)) {

            # File doesn't exist, so save the object
            save(list = deparse(substitute(obj_inpt)),
                 file = file_path)
            message("Created new .RData file")

      } else {
            # File exists, check if it already contains object
            # Load the file into a temporary environment to check contents
            temp_env <- new.env()
            loaded_objects <- load(file  = file_path,
                                   envir = temp_env)

            if (obj_name %in% loaded_objects) {

                  # Get the object from the temporary environment
                  existing_obj <- get(obj_name, envir = temp_env)

                  # Compare with the current object
                  if (identical(obj_inpt, existing_obj)) {
                        # They are identical - skip saving
                        message("Object already exists in target .RData - skipping")

                  }

            } else {
                  # Object doesn't exist in file, so add it using resave
                  cgwtools::resave(list = deparse(substitute(obj_inpt)),
                                   file = file_path)
                  message("Added object to existing target .RData")
            }

            # Clean up temporary environment
            rm(temp_env)
      }
}
