#' Remove Split-Table Column Suffixes
#'
#' @description
#' Removes the `"_1"` and `"_2"` suffixes from column labels in a `gt` table.
#' Intended for use after [`split_table()`], where a data frame has been split
#' into two side-by-side halves and the column names were suffixed to distinguish
#' the duplicated fields.
#'
#' @param x A `gt` table object.
#'
#' @return A `gt` table with `"_1"` and `"_2"` removed from the column labels.
#'
#' @examples
#' df <- tibble::tibble(
#'   player = c("A", "B", "C", "D"),
#'   points = c(1, 2, 3, 4)
#' )
#'
#' df |>
#'   split_table() |>
#'   gt::gt() |>
#'   split_cols_label()
#'
#' @export
split_cols_label <- function(x) {
  stopifnot("x should be a gt" = inherits(x, "gt_tbl"))

  x |>
    gt::cols_label_with(
      fn = ~ stringr::str_remove(., "_1")
    ) |>
    gt::cols_label_with(
      fn = ~ stringr::str_remove(., "_2")
    )
}
