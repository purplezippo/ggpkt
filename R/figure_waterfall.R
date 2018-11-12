#' Customizated figure of waterfull.
#'
#' waterfull with bars.
#'
#' @param overlap \code{logical} Use the scale for overlapping points?
#'
#' @note
#'
#' This function is customizated by using the \code{waterfall()} function
#' from package waterfalls
#'
#' @example inst/examples/ex-waterfall.R
#' @references
#' CRAN \url{https://cran.r-project.org/} waterfalls
#'
#' @family figures
#' @export
fig_waterfull <- function(values, start_label = 'start', end_label = 'end'){
  labels <- c(start_label)
  fill_colors <- c('darkslateblue')
  for (i in values[-1]) {
    if (i > 0) {
      labels <- c(labels, '增加')
      fill_colors <- c(fill_colors, '#FF7F0E')
    } else if (i < 0) {
      labels <- c(labels, '减少')
      fill_colors <- c(fill_colors, '#1F77B4')
    } else {
      stop('Values must be none zero.')
    }
  }

  plot.data <- data.frame(
    label = labels,
    value = values, stringsAsFactors = F
  )

  fig <- waterfall(
    .data = plot.data ,
    rect_text_labels = paste(plot.data$label,'\n',plot.data$value),
    rect_text_size = 1.3,
    fill_colours = fill_colors,
    calc_total = TRUE,
    total_rect_color = "darkslateblue",
    total_rect_text = paste(end_label,'\n',sum(plot.data$value)),
    total_rect_text_color = "black",
    total_axis_text = end_label,
    rect_width = 0.6,
    draw_axis.x = "behind",
    rect_border = "white",
    fill_by_sign = FALSE
  ) +
    theme_report01() +
    theme(axis.title.x = element_blank()) +
    geom_hline(yintercept = 0, colour = 'grey30') +
    scale_y_continuous('')
  return(fig)
}