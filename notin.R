# Not in
# A logical function that tests whether object x is not included in object y.
# (the opposite of `%in%`)

'%!in%' <- function(x, y) !('%in%'(x, y))
