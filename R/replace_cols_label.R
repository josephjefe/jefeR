#' Replace Text in Column Labels
#'
#' @description
#' Replaces a specified string or pattern in column labels of a `gt` table.
#' Useful for renaming or cleaning displayed column names.
#'
#' @param x A `gt` table object.
#' @param string A character string or regular expression to search for in column labels.
#' @param replacement A character string to replace matches of `string`.
#'
#' @return A `gt` table with updated column labels.
#'
#' @examples
#' df <- tibble::tibble(
#'   player_1 = c("A", "B"),
#'   player_2 = c("C", "D")
#' )
#'
#' df |>
#'   gt::gt() |>
#'   replace_cols_label("_1", "_A")
#'
#' @export
replace_cols_label <- function(x, string, replacement) {
  stopifnot("x should be a gt" = inherits(x, "gt_tbl"))

  x |>
    gt::cols_label_with(
      fn = ~ stringr::str_replace(., string, replacement)
    )
}
