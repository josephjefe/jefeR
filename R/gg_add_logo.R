#' Add a Logo to a ggplot
#'
#' @description
#' Overlays a logo onto a `ggplot2` object using `{cowplot}`. By default,
#' uses the packaged Jefe logo stored internally in the package.
#'
#' @param plot A `ggplot2` object.
#' @param logo_path A file path to the logo image. Defaults to the internal
#' Jefe logo included with the package.
#' @param x Horizontal position of the logo (0–1 scale).
#' @param y Vertical position of the logo (0–1 scale).
#' @param width Width of the logo relative to the plot (0–1 scale).
#' @param height Height of the logo relative to the plot (0–1 scale).
#' @param top_margin Top margin (in mm) added to the plot.
#' @param right_margin Right margin (in mm) added to the plot.
#' @param bottom_margin Bottom margin (in mm) added to the plot.
#' @param left_margin Left margin (in mm) added to the plot.
#'
#' @return A `ggplot2` object with the logo applied.
#'
#' @examples
#' \dontrun{
#' p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
#'   ggplot2::geom_point()
#'
#' gg_add_logo(p)
#' }
#'
#' @export
gg_add_logo <- function(
  plot,
  logo_path = jefe_logo(),
  x = 0.02,
  y = -0.04,
  width = 0.25,
  height = 0.2,
  top_margin = 3,
  right_margin = 3,
  bottom_margin = 10,
  left_margin = 3
) {
  # Validate logo path
  if (logo_path == "") {
    stop(
      "Logo file not found. Make sure 'inst/images/Jefe Logo Skyline.png' exists in the package.",
      call. = FALSE
    )
  }

  # Read the logo image
  logo_img <- magick::image_read(logo_path)

  # Add margins to the plot
  plot_with_margin <- plot +
    ggplot2::theme(
      plot.margin = grid::unit(
        c(top_margin, right_margin, bottom_margin, left_margin),
        units = "mm"
      )
    )

  # Create the final plot with logo
  final_plot <- cowplot::ggdraw() +
    cowplot::draw_plot(plot_with_margin) +
    cowplot::draw_image(
      logo_img,
      x = x,
      y = y,
      width = width,
      height = height,
      clip = "off"
    )

  final_plot
}
