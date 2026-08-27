#' Add Corner Labels to a ggplot
#'
#' @description
#' Adds up to four labels to the corners of a ggplot using `ggplot2::geom_label()`.
#' Labels are positioned using infinite coordinates so they remain anchored to
#' plot corners regardless of scale limits. Optional inward offsets can be used
#' to move the labels away from the plot edges.
#'
#' @param top_left Character string for the top-left label.
#' @param top_right Character string for the top-right label.
#' @param bottom_left Character string for the bottom-left label.
#' @param bottom_right Character string for the bottom-right label.
#' @param reverse_x Logical. If `TRUE`, reverses horizontal positioning to match
#' reversed x-axis scales.
#' @param reverse_y Logical. If `TRUE`, reverses vertical positioning to match
#' reversed y-axis scales.
#' @param fill Fill color for the label background.
#' @param color Text color for the labels.
#' @param alpha Transparency level of the label background.
#' @param size Text size of the labels.
#' @param padding Numeric value controlling label padding (in lines).
#' @param offset_x Numeric inward horizontal offset applied through `hjust`.
#' Larger values move labels farther inward from the left and right edges.
#' @param offset_y Numeric inward vertical offset applied through `vjust`.
#' Larger values move labels farther inward from the top and bottom edges.
#'
#' @return A `ggplot2` layer that can be added to a plot.
#'
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
#'   ggplot2::geom_point() +
#'   corner_labels(
#'     top_left = "Top Left",
#'     top_right = "Top Right",
#'     bottom_left = "Bottom Left",
#'     bottom_right = "Bottom Right",
#'     offset_x = 0.25,
#'     offset_y = 0.25
#'   )
#'
#' @export
corner_labels <- function(
  top_left = "Top Left",
  top_right = "Top Right",
  bottom_left = "Bottom Left",
  bottom_right = "Bottom Right",
  reverse_x = FALSE,
  reverse_y = FALSE,
  fill = "#ffe4e1",
  color = "#E31837",
  alpha = 0.75,
  size = 3,
  padding = 0.25,
  offset_x = 0.2,
  offset_y = 0.2
) {
  if (!reverse_x) {
    x <- c(-Inf, Inf, -Inf, Inf)
  } else {
    x <- c(Inf, -Inf, Inf, -Inf)
  }

  if (!reverse_y) {
    y <- c(Inf, Inf, -Inf, -Inf)
  } else {
    y <- c(-Inf, -Inf, Inf, Inf)
  }

  ggplot2::geom_label(
    data = tibble::tibble(
      x = x,
      y = y,
      label = c(top_left, top_right, bottom_left, bottom_right),
      hjust = c(0 - offset_x, 1 + offset_x, 0 - offset_x, 1 + offset_x),
      vjust = c(1 + offset_y, 1 + offset_y, 0 - offset_y, 0 - offset_y)
    ),
    mapping = ggplot2::aes(
      x = x,
      y = y,
      label = label,
      hjust = hjust,
      vjust = vjust
    ),
    fill = fill,
    color = color,
    alpha = alpha,
    size = size,
    label.padding = grid::unit(padding, "lines")
  )
}
