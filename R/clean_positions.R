#' Clean Football Position Labels
#'
#' @description
#' Standardizes football position labels using a predefined mapping table.
#' Supports returning multiple levels of position grouping, including cleaned
#' positions, generic groupings, and unit classifications (offense, defense,
#' special teams).
#'
#' @param pos A character vector of position labels.
#' @param target One of `"clean"`, `"generic"`, or `"unit"` indicating which
#' version of the position to return.
#' @param additional_pairs An optional data frame of additional mappings to
#' append to the default position map. Must include at least columns `"raw"`
#' and `"clean"`. Optional columns `"generic"` and `"unit"` will be filled
#' if missing.
#' @param keep_original Logical. If `TRUE`, values that do not match any mapping
#' will return their original input instead of `NA`.
#'
#' @return A character vector of standardized position labels corresponding to
#' the selected `target`.
#'
#' @examples
#' clean_positions(c("LT", "RDE", "Slot WR"))
#'
#' clean_positions(
#'   c("LT", "RDE", "Slot WR"),
#'   target = "generic"
#' )
#'
#' # With additional mappings
#' extra_map <- tibble::tibble(
#'   raw = "HB",
#'   clean = "RB"
#' )
#'
#' clean_positions(c("HB", "FB"), additional_pairs = extra_map)
#'
#' @export
clean_positions <- function(
  pos,
  target = c("clean", "generic", "unit"),
  additional_pairs = NULL,
  keep_original = TRUE
) {
  target <- match.arg(target)

  normalize_pos <- function(x) {
    x |>
      stringr::str_to_upper() |>
      stringr::str_trim() |>
      stringr::str_replace_all("\\s+", "") |>
      stringr::str_replace_all("[-,;|]+", "/") |>
      stringr::str_replace_all("/+", "/") |>
      stringr::str_replace("/.*$", "")
  }

  map_use <- positions_map

  # ---- additional mappings ----
  if (!is.null(additional_pairs)) {
    if (!all(c("raw", "clean") %in% names(additional_pairs))) {
      stop("additional_pairs must contain at least `raw` and `clean`.")
    }

    if (!"generic" %in% names(additional_pairs)) {
      additional_pairs <- additional_pairs |>
        dplyr::mutate(generic = clean)
    }

    if (!"unit" %in% names(additional_pairs)) {
      additional_pairs <- additional_pairs |>
        dplyr::mutate(unit = NA_character_)
    }

    additional_pairs <- additional_pairs |>
      dplyr::transmute(
        raw = normalize_pos(raw),
        clean = stringr::str_to_upper(clean),
        generic = stringr::str_to_upper(generic),
        unit = unit
      )

    map_use <- dplyr::bind_rows(additional_pairs, map_use) |>
      dplyr::distinct(raw, .keep_all = TRUE)
  }

  # ---- lookup ----
  lookup <- map_use[[target]]
  names(lookup) <- map_use$raw

  pos_std <- normalize_pos(pos)
  out <- unname(lookup[pos_std])

  if (keep_original) {
    out[is.na(out)] <- pos[is.na(out)]
  }

  out
}
