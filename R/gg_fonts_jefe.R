#' Load and Register Google Fonts for ggplot
#'
#' @description
#' Downloads and registers Google Fonts for use in ggplot2 visualizations.
#' This function uses `{sysfonts}` to load fonts and `{showtext}` to enable
#' consistent rendering across devices.
#'
#' @param title_font A character string specifying the font used for titles.
#' @param subtitle_font A character string specifying the font used for subtitles.
#' @param body_font A character string specifying the font used for body text.
#'
#' @return Invisibly returns `NULL`. Called for its side effects.
#'
#' @examples
#' \dontrun{
#' gg_fonts_jefe()
#' }
#'
#' @export
gg_fonts_jefe <- function(
  title_font = "Merriweather",
  subtitle_font = "Source Sans 3",
  body_font = "Roboto"
) {
  # Get the fonts from Google
  sysfonts::font_add_google(
    name = title_font,
    family = "title_font_family"
  )

  sysfonts::font_add_google(
    name = subtitle_font,
    regular.wt = 600,
    family = "subtitle_font_family"
  )

  sysfonts::font_add_google(
    name = body_font,
    family = "body_font_family"
  )

  # Enable showtext
  showtext::showtext_auto()

  # Set DPI to match RStudio default graphics device
  showtext::showtext_opts(dpi = 300)

  invisible(NULL)
}
