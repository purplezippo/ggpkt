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
fig_waterfall <- function(
  values,
  colors = c('start' = '#558ED5', 'increase' = '#51A047', 'reduce' = '#F1B255'),
  start_label = 'start', end_label = 'end'){
  labels <- c(start_label)
  fill_colors <- c(colors[1])
  for (i in values[-1]) {
    if (i > 0) {
      labels <- c(labels, '增加')
      fill_colors <- c(fill_colors, colors[2])
    } else if (i < 0) {
      labels <- c(labels, '减少')
      fill_colors <- c(fill_colors, colors[3])
    } else {
      stop('Values must be none zero.')
    }
  }

  plot.data <- data.frame(
    label = as.character(1:length(labels)),
    value = values, stringsAsFactors = F
  )

  set_fonts()

  fig <- mywf(
    .data = plot.data,
    values = NA,
    rect_text_labels = paste(labels,'\n', values),
    rect_text_size = 1.5,
    rect_text_color = '#2F3038',
    theme_text_family = 'thefont',
    fill_colours = fill_colors,
    calc_total = TRUE,
    total_rect_color = colors[1],
    total_rect_text = paste(end_label,'\n',sum(values)),
    total_rect_text_color = "#2F3038",
    total_axis_text = as.character(length(labels) + 1),
    rect_width = 0.6,
    draw_axis.x = "behind",
    rect_border = "white",
    fill_by_sign = FALSE
  ) +
    ggpkt::theme_rp_light() +
    ggplot2::theme(
      axis.title.x = element_blank()
      ) +
    ggplot2::geom_hline(yintercept = 0, colour = 'grey30') +
    ggplot2::scale_y_continuous('')
  return(fig)
}
