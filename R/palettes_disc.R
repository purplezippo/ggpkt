#' YIK color palette (discrete)
#'
#' @param isdark Use the dark style colors.
#' @family colour business
#' @rdname palette_disc
#' @export
#' @example inst/examples/ex-palette_disc.R
pal_business <- function(isdark = FALSE) {
  colors <- ggpkt::ycolors[['business']][['discrete']]
  max_n <- 9

  if (!isdark) {
    f <- function(n) {
      check_pal_n(n, max_n)
      if (n <= 6) {
        cols <- colors[['pal_light6']][seq_len(n)]
      } else {
        cols <- colors[['pal_light9']][seq_len(n)]
      }
      cols
    }
  } else {
    f <- function(n) {
      check_pal_n(n, max_n)
      if (n <= 6) {
        cols <- colors[['pal_dark6']][seq_len(n)]
      } else {
        cols <- colors[['pal_dark9']][seq_len(n)]
      }
      cols
    }
  }

  attr(f, "max_n") <- max_n
  f
}


#' @rdname palette_disc
#' @export
pal_academic <- function(isdark = FALSE) {
  colors <- ggpkt::ycolors[['academic']][['discrete']]
  if (!isdark) {
    manual_pal(colors[['pal_light7']])
  } else {
    manual_pal(colors[['pal_dark6']])
  }
}