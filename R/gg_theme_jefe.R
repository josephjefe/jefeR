#' Jefe ggplot2 Theme
#'
#' @description
#' Applies a personal `ggplot2` theme using custom font families, color settings,
#' grid styling, and optional logo tag placement. Intended for use with fonts
#' registered via [`gg_fonts_jefe()`].
#'
#' @param base_size Base font size passed to `ggplot2::theme_minimal()`.
#' @param base_family Base font family passed to `ggplot2::theme_minimal()`.
#' @param title_font Font family used for plot titles.
#' @param subtitle_font Font family used for plot subtitles.
#' @param caption_font Font family used for plot captions.
#' @param axis_font Font family used for axis titles and axis text.
#' @param legend_title_font Font family used for legend titles.
#' @param legend_text_font Font family used for legend text.
#' @param title_color Color used for plot titles.
#' @param subtitle_color Color used for plot subtitles.
#' @param caption_color Color used for plot captions.
#' @param axis_title_color Color used for axis titles.
#' @param axis_text_color Color used for axis text.
#' @param major_grid_color Color used for major grid lines.
#' @param minor_grid_color Color used for minor grid lines.
#' @param background_color Fill color used for the plot and panel background.
#' @param border_color Color used for the outer plot border.
#' @param border_size Line width used for the outer plot border.
#' @param logo_tag Logical. If `TRUE`, enables styling for a logo added via the
#' plot tag.
#' @param logo_size Size passed to `ggpath::element_path()` for the plot tag.
#' @param logo_position_x Horizontal position of the plot tag.
#' @param logo_position_y Vertical position of the plot tag.
#' @param margin Numeric value used for selected text margins.
#'
#' @return A `ggplot2` theme object.
#'
#' @examples
#' \dontrun{
#' ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
#'   ggplot2::geom_point() +
#'   gg_theme_jefe()
#' }
#'
#' @export
gg_theme_jefe <- function(
  base_size = 11,
  base_family = "body_font_family",
  title_font = "title_font_family",
  subtitle_font = "subtitle_font_family",
  caption_font = "body_font_family",
  axis_font = "body_font_family",
  legend_title_font = "subtitle_font_family",
  legend_text_font = "body_font_family",
  title_color = "#2C3E50",
  subtitle_color = "#5D6D7E",
  caption_color = "#85929E",
  axis_title_color = "#34495E",
  axis_text_color = "#2C3E50",
  major_grid_color = "#E8EAED",
  minor_grid_color = "#F1F3F4",
  background_color = "#F8F9FA",
  border_color = "#DADCE0",
  border_size = 0.5,
  logo_tag = TRUE,
  logo_path = jefe_logo(),
  logo_size = 3.5,
  logo_position_x = 0.02,
  logo_position_y = 0.005,
  margin = 10
) {
  base_theme <- ggplot2::theme_minimal(
    base_size = base_size,
    base_family = base_family
  ) +
    ggplot2::theme(
      plot.title.position = "plot",
      plot.title = ggplot2::element_text(
        family = title_font,
        face = "bold",
        color = title_color,
        hjust = 0,
        margin = ggplot2::margin(b = margin)
      ),
      plot.subtitle = ggplot2::element_text(
        family = subtitle_font,
        color = subtitle_color,
        hjust = 0
      ),
      plot.caption = ggplot2::element_text(
        family = caption_font,
        color = caption_color
      ),
      plot.margin = ggplot2::margin(
        t = 10,
        r = 10,
        b = 10,
        l = 10,
        unit = "pt"
      ),
      axis.title.x = ggplot2::element_text(
        family = axis_font,
        color = axis_title_color,
        margin = ggplot2::margin(t = 10, b = 10, unit = "pt")
      ),
      axis.title.y = ggplot2::element_text(
        family = axis_font,
        color = axis_title_color
      ),
      axis.text = ggplot2::element_text(
        family = axis_font,
        color = axis_text_color
      ),
      axis.ticks = ggplot2::element_blank(),
      legend.title = ggplot2::element_text(
        family = legend_title_font,
        face = "bold"
      ),
      legend.text = ggplot2::element_text(
        family = legend_text_font
      ),
      panel.grid.major = ggplot2::element_line(
        color = major_grid_color,
        linewidth = 0.5
      ),
      panel.grid.minor = ggplot2::element_line(
        color = minor_grid_color,
        linewidth = 0.5
      ),
      panel.grid.minor.x = ggplot2::element_blank(),
      plot.background = ggplot2::element_rect(
        fill = background_color,
        color = border_color,
        linewidth = border_size
      ),
      panel.background = ggplot2::element_rect(
        fill = background_color,
        color = NA
      )
    )

  if (logo_tag) {
    list(
      ggplot2::labs(tag = logo_path),
      base_theme +
        ggplot2::theme(
          plot.tag = ggpath::element_path(
            size = logo_size,
            vjust = 0,
            hjust = 0
          ),
          plot.tag.position = c(logo_position_x, logo_position_y)
        )
    )
  } else {
    base_theme
  }
}
