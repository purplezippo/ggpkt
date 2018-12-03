#~~~~~~~~~~~~~~ palettes ~~~~~~~~~~~~~#-------------------------------------####

#' Color palettes (continuous)
#'
#' @param isseq \code{logical}, if TRUE called with a numeric vector with values
#'   between 0 and 1 returns the corresponding values in the range the scale
#'   maps to, if FALSE called with a integer value controls the number of colours
#'   to be returned.
#' @family colour palette
#' @rdname palette_cont
#' @export
#' @example inst/examples/ex-palette_cont.R
pal_red_cont <- function(isseq = TRUE){
  low <- '#C65865'
  high <- '#ffdaf4'
  if (isseq) {
    f <- seq_gradient_pal(low, high, 'Lab')
  } else {
    f <- colorRampPalette(c(low, high))
  }
  f
}

#' @rdname palette_cont
#' @export
pal_blue_cont <- function(isseq = TRUE){
  low <- '#1866A1'
  high <- '#81D4FA'
  if (isseq) {
    f <- seq_gradient_pal(low, high, 'Lab')
  } else {
    f <- colorRampPalette(c(low, high))
  }
  f
}

#~~~~~~~~~~~~~~ scales ~~~~~~~~~~~~~~#-------------------------------------####

#' Closure function to create continuous scales.
fa_business_scale <- function(aesthetics = "fill"){
  scale.fun <- function(
    ..., col.scheme = 'red', na.value = "grey50", guide = "colourbar"
  ) {
    if (col.scheme == 'red') {
      pal = ggpkt::pal_red_cont()
    } else if (col.scheme == 'blue') {
      pal = ggpkt::pal_blue_cont()
    } else {
      stop('colour scheme not found')
    }
    continuous_scale(
      aesthetics, 'business', pal, na.value = na.value,
      guide = guide, ...
    )
  }
  return(scale.fun)
}


#' Scales for continuous values
#'
#' @param col.sacheme Only valid with continuous scales, for now only two colour
#' schemes(\code{c('red', 'blue')}) are provided.
#' @rdname scale_cont
#' @export
scale_fill_continuous_yk <- fa_business_scale("fill")

#' @rdname scale_cont
#' @export
scale_colour_continuous_yk <- fa_business_scale("colour")

#' @rdname scale_cont
#' @export
scale_color_continuous_yk <- scale_colour_continuous_yk
