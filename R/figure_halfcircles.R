#' Circle Chart for Data Comparison
#'
#' Show all datas in a sequential way, and emphasis the special one.
#'
#' @param rawdata A \code{data.frame} contains the data to be plot. Three columns
#'   are needed here, 'values': numeric, provide datas; 'types': used to map colours
#'   to each data, character or factor; 'labels': characters to describe the correspond
#'   data.
#' @param title \code{character} value defines the title.
#' @param subtitle \code{character} value defines the subtitle.
#' @param caption \code{character} value defines the caption.
#' @param palette Palette applied to the plot.
#'
#'
#' @seealso \code{\link{fig_halfcircles_emph}()} for references.
#'
#' @example inst/examples/ex-halfcircles.R
#'
#' @family figure circle
#'
#' @export
fig_halfcircles <- function(
  rawdata, title, subtitle, caption, palette = 'Oranges'
  ) {
  set_fonts()
  circle.points <- scl_circle(rawdata$values, break_angles = 200)
  circle.points.lab <-
    dplyr::left_join(circle.points, rawdata[, c('values', 'types')], by = 'values')
  rawdata$dlabels <- paste(rawdata$values, rawdata$labels, sep = '     ')

  ggplot() +
    geom_path(
      data = circle.points.lab,
      aes(x = x, y = y, group = types, color = types)
      ) +
    geom_segment(
      aes(x = 0, y = 0, xend = max(circle.points.lab$x), yend = 0),
      color = "white", size = 1
      ) +
    geom_point(data = rawdata, aes(x = values, y = 0), size = 3, col = 'white') +
    theme(
      legend.position = 'none',
      panel.background = element_rect(fill = "black"),
      plot.background = element_rect(fill = "black"),
      axis.text.x = element_text(angle = -90, colour = "white", hjust = 0, size = 8),
      axis.text.y = element_blank(),
      panel.grid = element_blank(),
      axis.ticks = element_blank(),
      plot.margin = unit(c(1, .5, 1.6, .5), "lines"),
      panel.spacing = unit(c(0, 0, 0, 0), "lines"),
      # text = element_text(family = "thefont"),
      plot.title = element_text(size = 40, colour = "white", lineheight = 1.2),
      plot.subtitle = element_text(size = 30, colour = "white", lineheight = 1.2),
      plot.caption = element_text(size = 20, hjust = 0, colour = "white"),
      panel.border = element_blank()
    ) +
    scale_x_continuous(breaks = rawdata$values, labels = rawdata$dlabels) +
    labs(x = "", y = "", title = title, subtitle = subtitle, caption = caption) +
    scale_color_brewer(palette = palette)

}


#' @param colours A \code{vector} of length two, contains colours which applied
#'  to different data.
#'
#' @seealso \code{\link{fig_halfcircles}()} for references.
#'
#' @rdname fig_halfcircles
#'
#' @export
fig_halfcircles_emph <- function(
  rawdata, title, subtitle, caption, colours = c('white','orange')
) {
  set_fonts()
  circle.points <- scl_circle(rawdata$values, break_angles = 200)

  circle.points.lab <-
    dplyr::left_join(circle.points, rawdata[, c('values', 'types')], by = 'values')

  rawdata$dlabels <- paste(rawdata$values, rawdata$labels, sep = '     ')

  ggplot() +
    geom_path(
      data = circle.points.lab,
      aes(x = x, y = y, group = types, color = types)
    ) +
    geom_segment(
      aes(x = 0, y = 0, xend = max(circle.points.lab$x), yend = 0),
      color = "white", size = 1
    ) +
    geom_point(data = rawdata, aes(x = values, y = 0), size = 3, col = 'white') +
    theme(
      legend.position = 'none',
      panel.background = element_rect(fill = "black"),
      plot.background = element_rect(fill = "black"),
      axis.text.x = element_text(angle = -90, colour = "white", hjust = 0, size = 8),
      axis.text.y = element_blank(),
      panel.grid = element_blank(),
      axis.ticks = element_blank(),
      plot.margin = unit(c(1, .5, 1.6, .5), "lines"),
      panel.spacing = unit(c(0, 0, 0, 0), "lines"),
      # text = element_text(family = "thefont"),
      plot.title = element_text(size = 40, colour = "white", lineheight = 1.2),
      plot.subtitle = element_text(size = 30, colour = "white", lineheight = 1.2),
      plot.caption = element_text(size = 20, hjust = 0, colour = "white"),
      panel.border = element_blank()
    ) +
    scale_x_continuous(breaks = rawdata$values, labels = rawdata$dlabels) +
    labs(x = "", y = "", title = title, subtitle = subtitle, caption = caption) +
    scale_color_manual(values = colours)

}

