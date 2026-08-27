#' Save a gt Table with Background and Border
#'
#' @description
#' Saves a `gt` table to file and adds optional background padding and a border
#' using `{magick}`. This function first saves the table without expansion,
#' then applies padding and border styling as a post-processing step.
#'
#' @param gt_object A `gt` table object.
#' @param path Directory where the file will be saved.
#' @param filename Output file name (including extension).
#' @param background_color Background color used for expansion padding.
#' @param border_color Border color applied around the image.
#' @param border_size Numeric size of the border (in pixels).
#' @param expand Numeric padding size (in pixels) added around the image.
#' @param vwidth Optional viewport width passed to [`gt::gtsave()`].
#' @param vheight Optional viewport height passed to [`gt::gtsave()`].
#' @param ... Additional arguments passed to [`gt::gtsave()`].
#'
#' @return Invisibly returns the file path of the saved image.
#'
#' @examples
#' \dontrun{
#' df <- tibble::tibble(
#'   player = c("A", "B"),
#'   value = c(1, 2)
#' )
#'
#' gt_tbl <- gt::gt(df)
#'
#' gtsave_with_border(
#'   gt_tbl,
#'   filename = "table.png"
#' )
#' }
#'
#' @export
gtsave_with_border <- function(
  gt_object,
  path = ".",
  filename,
  background_color = "#F8F9FA",
  border_color = "#DADCE0",
  border_size = 1,
  expand = 30,
  vwidth = NULL,
  vheight = NULL,
  ...
) {
  if (missing(filename)) {
    stop("`filename` must be provided.", call. = FALSE)
  }

  if (!requireNamespace("magick", quietly = TRUE)) {
    stop(
      "Package 'magick' is required for this function. Please install it with: install.packages('magick')",
      call. = FALSE
    )
  }

  temp_ext <- paste0(".", tools::file_ext(filename))
  temp_path <- tempfile(pattern = "gt_", tmpdir = path, fileext = temp_ext)
  temp_filename <- basename(temp_path)
  final_path <- file.path(path, filename)

  gt::gtsave(
    gt_object,
    path = path,
    filename = temp_filename,
    expand = 0,
    vwidth = vwidth,
    vheight = vheight,
    ...
  )

  img <- magick::image_read(temp_path)

  if (expand > 0) {
    img <- magick::image_border(
      img,
      color = background_color,
      geometry = paste0(expand, "x", expand)
    )
  }

  if (border_size > 0) {
    img <- magick::image_border(
      img,
      color = border_color,
      geometry = paste0(border_size, "x", border_size)
    )
  }

  magick::image_write(img, final_path)

  if (file.exists(temp_path)) {
    file.remove(temp_path)
  }

  invisible(final_path)
}
