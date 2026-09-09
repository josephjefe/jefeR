# INSTRUCTIONS-----
#
# This file is a reference for creating, updating, and publishing jefeR.
# The commands below are run in the RStudio Console, not inside functions.

# CREATE A NEW FUNCTION-----

# Create a new .R file and name it after the function.
# Or use this line to create the file for you:

usethis::use_r("jefe_logo")


# DOCUMENTATION-----

# Add roxygen2 documentation immediately above each function.
# Example:
#
#' Clean football position labels
#'
#' @param pos Character vector
#' @param target "clean", "generic", or "unit"
#' @export
#
# The @export tag makes the function available to users of the package.
# After adding/changing functions, regenerate the NAMESPACE and help files:

devtools::document()


# PACKAGE DEPENDENCIES-----

# If a function uses a package that jefeR depends on, add that package
# to DESCRIPTION using:

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

# Only run use_package() when adding a new dependency.
# You do not need to run it every time you update a function.

# TEST THE PACKAGE-----

# Check the package for errors/warnings:

devtools::check()

# Install the current local version for testing:

pak::local_install()


# PUBLISH TO GITHUB INITIALLY-----

# ONLY run these commands when setting up the GitHub repository
# for the first time. They have already been run for this package.

# Configure Git to use your GitHub noreply email:
# system('git config user.email "21974312+josephjefe@users.noreply.github.com"')

# Initialize Git:
# usethis::use_git()

# Connect/create the GitHub repository:
# usethis::use_github()

# OR, if the GitHub repository already exists and is empty:
# system("git remote add origin https://github.com/josephjefe/jefeR.git")

# Verify the remote:
# system("git remote -v")

# Push the initial version:
# system("git push -u origin main")

# UPDATE jefeR PACKAGE-----

# 1. Make changes to existing functions or add new functions.

# 2. Regenerate documentation/NAMESPACE:
devtools::document()

# 3. Test the package:
devtools::check()

# 4. Install the updated local package if desired:
pak::local_install()

# 5. Check what Git sees:
system("git status")

# 6. Stage all changes:
system("git add .")

# 7. Commit the changes:
system('git commit -m "Update jefeR functions"')

# 8. Push the changes to GitHub:
system("git push")
