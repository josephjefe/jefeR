#' Remove Text from Column Labels
#'
#' @description
#' Removes a specified string from column labels in a `gt` table. Useful for
#' cleaning or simplifying displayed column names.
#'
#' @param x A `gt` table object.
#' @param string A character string or regular expression to remove from column labels.
#'
#' @return A `gt` table with the specified text removed from column labels.
#'
#' @examples
#' df <- tibble::tibble(
#'   player_1 = c("A", "B"),
#'   player_2 = c("C", "D")
#' )
#'
#' df |>
#'   gt::gt() |>
#'   strip_cols_label("_1")
#'
#' @export
strip_cols_label <- function(x, string) {
  stopifnot("x should be a gt" = inherits(x, "gt_tbl"))

  x |>
    gt::cols_label_with(
      fn = ~ stringr::str_remove(., string)
    )
}
