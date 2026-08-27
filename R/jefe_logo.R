#' Path to the packaged Jefe logo
#'
#' @description
#' Returns the file path to the Jefe logo image stored in the package.
#'
#' @return A character string giving the path to the packaged logo image.
#'
#' @examples
#' jefe_logo()
#'
#' @export
jefe_logo <- function() {
  system.file("images", "Jefe Logo Skyline.png", package = "jefeR")
}
