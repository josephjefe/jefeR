#' Split a data frame into two side-by-side halves
#'
#' @description
#' Splits a data frame into two row-wise halves and binds them back together
#' column-wise. This creates a wider table with approximately half as many rows
#' and twice as many columns. If the input has an odd number of rows, a blank row
#' is added to the second half before binding.
#'
#' @param x A data frame.
#'
#' @return
#' A data frame with the first half of `x` in columns suffixed with `"_1"` and
#' the second half of `x` in columns suffixed with `"_2"`.
#'
#' @examples
#' df <- tibble::tibble(
#'   player = c("A", "B", "C", "D", "E"),
#'   points = c(1, 2, 3, 4, 5)
#' )
#'
#' split_table(df)
#'
#' @export
split_table <- function(x) {
  split1 <- x |>
    dplyr::slice_head(n = ceiling(nrow(x) / 2))
  colnames(split1) <- paste(colnames(split1), "_1", sep = "")

  split2 <- x |>
    dplyr::slice_tail(n = floor(nrow(x) / 2))
  colnames(split2) <- paste(colnames(split2), "_2", sep = "")

  if (nrow(split1) != nrow(split2)) {
    split2 <- tibble::add_row(split2)
  }

  dplyr::bind_cols(split1, split2)
}
