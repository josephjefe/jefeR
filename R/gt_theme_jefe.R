#' Jefe gt Theme
#'
#' @description
#' Applies a personal theme to a `gt` table using Google Fonts, custom colors,
#' table styling, and a branded source note containing a logo and caption.
#'
#' @param gt_object A `gt` table object.
#' @param ... Additional arguments passed to [`gt::tab_options()`].
#' @param quiet Logical. If `FALSE`, messages are shown when a random table ID
#' is assigned.
#' @param img_path A file path to the logo image shown in the source note.
#' Defaults to the packaged Jefe logo.
#' @param caption A character string shown alongside the logo in the source note.
#' @param title_font A Google Font name used for the table title.
#' @param subtitle_font A Google Font name used for the table subtitle.
#' @param header_font A Google Font name used for column labels, spanners, stub
#' heads, and row groups.
#' @param body_font A Google Font name used for body text and footnotes.
#' @param title_color Color used for the table title.
#' @param subtitle_color Color used for the table subtitle.
#' @param header_color Color used for headers and spanners.
#' @param body_color Color used for body text.
#' @param background_color Background color used for the table and column labels.
#' @param title_size Numeric font size for the title in pixels.
#' @param subtitle_size Numeric font size for the subtitle in pixels.
#' @param header_size Numeric font size for headers in pixels.
#' @param body_size Numeric font size for body text in pixels.
#' @param img_width Numeric width of the logo image in centimeters.
#'
#' @return A styled `gt_tbl` object.
#'
#' @examples
#' \dontrun{
#' df <- tibble::tibble(
#'   player = c("A", "B"),
#'   value = c(1, 2)
#' )
#'
#' df |>
#'   gt::gt() |>
#'   gt_theme_jefe()
#' }
#'
#' @export
gt_theme_jefe <- function(
  gt_object,
  ...,
  quiet = TRUE,
  img_path = jefe_logo(),
  caption = "Data: nflverse.com",
  title_font = "Merriweather",
  subtitle_font = "Source Sans 3",
  header_font = "Roboto",
  body_font = "Roboto",
  title_color = "#2C3E50",
  subtitle_color = "#5D6D7E",
  header_color = "#34495E",
  body_color = "#2C3E50",
  background_color = "#F8F9FA",
  title_size = 20,
  subtitle_size = 16,
  header_size = 14,
  body_size = 16,
  img_width = 4.5
) {
  stopifnot(
    "'gt_object' must be a 'gt_tbl', have you accidentally passed raw data?" = "gt_tbl" %in%
      class(gt_object)
  )

  if (img_path == "") {
    stop(
      "Logo file not found. Make sure 'inst/images/Jefe Logo Skyline.png' exists in the package.",
      call. = FALSE
    )
  }

  table_id <- subset(
    gt_object[["_options"]],
    parameter == "table_id"
  )[["value"]][[1]]

  if (is.na(table_id)) {
    table_id <- gt::random_id()

    if (isFALSE(quiet)) {
      message(glue::glue(
        "Table has no assigned ID, using random ID '{table_id}' to apply `gt::opt_css()`",
        "\nAvoid this message by assigning an ID: `gt(id = '')` or `gt_theme_jefe(quiet = TRUE)`"
      ))
    }

    opt_position <- which(
      "table_id" %in% gt_object[["_options"]][["parameter"]]
    )[[1]]

    gt_object[["_options"]][["value"]][[opt_position]] <- table_id
  }

  gt_object |>
    gt::opt_table_font(
      font = list(
        gt::google_font(body_font),
        gt::default_fonts()
      ),
      weight = 400
    ) |>
    gt::tab_style(
      locations = gt::cells_title("title"),
      style = gt::cell_text(
        font = gt::google_font(title_font),
        weight = 900,
        color = title_color,
        size = gt::px(title_size),
        align = "left"
      )
    ) |>
    gt::tab_style(
      locations = gt::cells_title("subtitle"),
      style = gt::cell_text(
        font = gt::google_font(subtitle_font),
        weight = 600,
        color = subtitle_color,
        size = gt::px(subtitle_size),
        align = "left"
      )
    ) |>
    gt::tab_style(
      style = gt::cell_text(
        font = gt::google_font(header_font),
        transform = "uppercase",
        v_align = "bottom",
        size = gt::px(header_size),
        weight = 700,
        color = header_color
      ),
      locations = list(
        gt::cells_column_labels(),
        gt::cells_stubhead(),
        gt::cells_row_groups()
      )
    ) |>
    gt::tab_style(
      style = gt::cell_text(
        font = gt::google_font(header_font),
        weight = 700,
        size = gt::px(header_size),
        color = header_color
      ),
      locations = gt::cells_column_spanners()
    ) |>
    gt::tab_style(
      style = gt::cell_text(
        font = gt::google_font(body_font),
        size = gt::px(body_size),
        color = body_color
      ),
      locations = gt::cells_body()
    ) |>
    gt::tab_style(
      style = gt::cell_text(
        font = gt::google_font(body_font),
        style = "italic",
        size = gt::px(12),
        color = "#85929E"
      ),
      locations = gt::cells_footnotes()
    ) |>
    gt::tab_style(
      style = list(
        gt::cell_text(
          font = body_font,
          size = gt::px(12),
          color = "#85929E"
        ),
        gt::cell_borders(
          sides = "top",
          color = "#5D6D7E",
          weight = gt::px(2)
        ),
        gt::cell_fill(color = "transparent"),
        gt::css(padding_top = "15px")
      ),
      locations = gt::cells_source_notes()
    ) |>
    gt::tab_options(
      column_labels.background.color = background_color,
      table.background.color = background_color,
      data_row.padding = gt::px(4),
      heading.border.bottom.style = "none",
      table.border.top.style = "none",
      table.border.bottom.style = "none",
      table.border.left.style = "none",
      table.border.right.style = "none",
      column_labels.font.weight = "bold",
      column_labels.border.top.style = "none",
      column_labels.border.bottom.width = gt::px(2),
      column_labels.border.bottom.color = "#5D6D7E",
      row_group.border.top.style = "none",
      row_group.border.bottom.width = gt::px(1),
      row_group.border.bottom.color = "#ECF0F1",
      stub.border.color = "#ECF0F1",
      stub.border.width = gt::px(1),
      table.font.size = body_size,
      heading.align = "center",
      ...
    ) |>
    gt::tab_source_note(
      source_note = gt::md(paste0(
        '<div style="width: 100%; display: table;">
           <div style="display: table-row">
             <div style="display: table-cell;">
               <img src="',
        img_path,
        '" style="width:',
        img_width,
        'cm;">
             </div>
             <div style="display: table-cell;vertical-align: middle;text-align: right">',
        caption,
        '</div>
           </div>
         </div>'
      ))
    )
}
