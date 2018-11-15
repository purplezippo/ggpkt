#' Scale circle
#'
#' @param vdata A \code{vector} variable contains values to be scaled.
#' @param break_angles A \code{integer} value, controls the points to be generate.
#'
#' family scale
#'
#' export
scl_circle <- function(vdata, break_angles = 100){
  res <- data.frame()
    for (i in vdata) {
      r <- i/2
      theta <- seq(0, pi, length.out = break_angles)
      a <- i/2
      b <- 0
      x <- a + r*cos(theta)
      y <- b + r*sin(theta)
      temp <- data.frame(values = rep(i, break_angles),x = x, y = y)
      res <- rbind(res, temp)
    }
  return(res)
}

scl_circle(c(10, 12))
