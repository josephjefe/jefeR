# INSTRUCTIONS-----

# To update your package:
# Create a new .R file and name it after the function, then paste your
# function into that page.
# Or use this line below to create the file for you:
usethis::use_r("jefe_logo")

# Add this code (modified to fit your script) at the top of each function:

#' Clean football position labels
#'
#' @param pos Character vector
#' @param target "clean", "generic", or "unit"
#' @export

# Tell the package what libraries you need for this package to work:
usethis::use_package("dplyr")
usethis::use_package("stringr")
usethis::use_package("tibble")
usethis::use_package("gt")
usethis::use_package("ggplot2")
usethis::use_package("ggpath")
usethis::use_package("cowplot")
usethis::use_package("magick")
usethis::use_package("sysfonts")
usethis::use_package("showtext")
usethis::use_package("glue")


# Run the below code to update your package.
devtools::document()
devtools::install()

# Use this to push the package to GitHub:
usethis::use_github()
