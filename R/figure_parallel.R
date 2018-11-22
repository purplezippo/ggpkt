#' Parallel Chart
#'
#' @param rawdata A data.frame with data in long format, there are four columns:
#' 'id', integer, identify each sample; 'group', character,group of each sample;
#' 'variable', character, the parallel axises; 'value', numeric, values mapped to
#'  each axis.
#' @param alpha Alpha channel for transparency.
#' @param add.point Whether add points to axises or not.
#' @param legend.size Size of legend key.
#' @param line.size Size of line.
#'
#' @family figure
#'
#' @example inst/examples/ex-parallel.R
#'
#' @export
fig_parallel <- function(
  rawdata,
  alpha  = .8,
  add.point = FALSE,
  legend.size = 8,
  line.size = 0.5
  ){
  pic <-
    ggplot(rawdata, aes(x = variable, y = value, group = id, col = group)) +
      geom_line(alpha = alpha, size = line.size) +
      guides(
        color = guide_legend(
          override.aes = list(size = legend.size), keyheight = 1, title = NULL
        )
      ) +
      theme_rp_light() +
      scale_x_discrete('') +
      scale_y_continuous('')

  if (add.point) {
    pic <- pic + geom_point(alpha = alpha)
  }
  pic
}
