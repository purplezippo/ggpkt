#~~~~~~~~~~~ pal business ~~~~~~~~~##---------------------------------------####

#' YIK color palette (discrete)
#'
#' @param isdark Use the dark style colors.
#' @family colour business
#' @rdname palette_disc
#' @name yik_palette_disc
#' @export
#' @example inst/examples/ex-palette_disc.R
pal_business_light <- function(isdark = FALSE) {
  colors <- ggpkt::ycolors[['business']][['discrete']]
  max_n <- 9

  f <- function(n) {
    check_pal_n(n, max_n)
    if (n <= 6) {
      cols <- colors[['pal_light_6']][seq_len(n)]
    } else {
      cols <- colors[['pal_light_9']][seq_len(n)]
    }
    cols
  }

  attr(f, "max_n") <- max_n
  f
}

#' @rdname palette_disc
#' @export
pal_business_dark <- function(isdark = FALSE) {
  colors <- ggpkt::ycolors[['business']][['discrete']]
  max_n <- 9

  f <- function(n) {
    check_pal_n(n, max_n)
    if (n <= 6) {
      cols <- colors[['pal_dark_6']][seq_len(n)]
    } else {
      cols <- colors[['pal_dark_9']][seq_len(n)]
    }
    cols
  }

  attr(f, "max_n") <- max_n
  f
}

#' @rdname palette_disc
#' @export
pal_business_light2 <- function(isdark = FALSE) {
  colors <- ggpkt::ycolors[['business']][['discrete']]
  max_n <- 12

  f <- function(n) {
    check_pal_n(n, max_n)
    if (n <= 9) {
      cols <- colors[['pal_light2_9']][seq_len(n)]
    } else {
      cols <- colors[['pal_light2_12']][seq_len(n)]
    }
    cols
  }

  attr(f, "max_n") <- max_n
  f
}

#' @rdname palette_disc
#' @export
pal_business_dark2 <- function(isdark = FALSE) {
  colors <- ggpkt::ycolors[['business']][['discrete']]
  max_n <- 12

  f <- function(n) {
    check_pal_n(n, max_n)
    if (n <= 9) {
      cols <- colors[['pal_dark2_9']][seq_len(n)]
    } else {
      cols <- colors[['pal_dark2_12']][seq_len(n)]
    }
    cols
  }

  attr(f, "max_n") <- max_n
  f
}


#' @rdname palette_disc
#' @export
pal_business_bright <- function(){
  colors <- ggpkt::ycolors[['business']][['discrete']]
  max_n <- 12

  f <- function(n) {
    check_pal_n(n, max_n)
    if (n <= 9) {
      cols <- colors[['pal_bright_9']][seq_len(n)]
    } else {
      cols <- colors[['pal_bright_12']][seq_len(n)]
    }
    cols
  }

  attr(f, "max_n") <- max_n
  f
}

#' @rdname palette_disc
#' @export
pal_business_grey <- function(){
  colors <- ggpkt::ycolors[['business']][['discrete']]
  max_n <- 12

  f <- function(n) {
    check_pal_n(n, max_n)
    if (n <= 9) {
      cols <- colors[['pal_grey_9']][seq_len(n)]
    } else {
      cols <- colors[['pal_grey_12']][seq_len(n)]
    }
    cols
  }

  attr(f, "max_n") <- max_n
  f
}

#' @rdname palette_disc
#' @export
pal_business_warm <- function(){
  colors <- ggpkt::ycolors[['business']][['discrete']]
  manual_pal(colors[['pal_warm_6']])
}

#' @rdname palette_disc
#' @export
pal_business_cool <- function(){
  colors <- ggpkt::ycolors[['business']][['discrete']]
  manual_pal(colors[['pal_cool_6']])
}

#~~~~~~~~~~~ pal academic ~~~~~~~~~##---------------------------------------####
#' @rdname palette_disc
#' @export
pal_academic_light <- function() {
  colors <- ggpkt::ycolors[['academic']][['discrete']]
  manual_pal(colors[['pal_light_7']])
}


#' @rdname palette_disc
#' @export
pal_academic_dark <- function(isdark = FALSE) {
  colors <- ggpkt::ycolors[['academic']][['discrete']]
  manual_pal(colors[['pal_dark_6']])
}






