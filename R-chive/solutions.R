
# Force installation to a temp folder
install.packages("stringi", INSTALL_opts = "--no-lock")


# Conditionally change values of multiple columns in a matrix
hw5mtx[hw5mtx[, "group"] == 0, c("group:var1", "group:var2", "group:var3")] <- 0
