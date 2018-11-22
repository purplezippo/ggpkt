#' Bubble Graph
#'
#' This function gives a way to draw a point matrix, with both the x and y axises
#' are discrete variables and map the values to the size of points.
#'
#' @param rawdata A \code{data.frame} with three columns as follows:
#' 'xlabel',character vector for discrete variables in x axis;
#' 'ylabel',character vector for discrete variables in y axis;
#' 'values',numeric vector defines the data value to be ploted.
#' @param text.size.x The text size of x axis.
#' @param text.size.y The text size of y axis.
#' @param palette  The palette used for points.
#' @param bubble.size.range A \code{vector} with length two, defines the size of
#' points, the format is like c(minsize, maxsize).
#'
#' @example inst/examples/ex-bubble_rect.R
#'
#' @family figure
#'
#' @export
fig_bubble_rect <- function(
  rawdata, text.size.x = 12, text.size.y = 12, palette = 'Spectral',
  bubble.size.range = c(3, 15)
  ){
  set_fonts()
  temp_theme <- theme_light() + theme(
    # fonts
    title = element_text(size = 15, colour = 'black'),
    legend.text = element_text(size = 8),
    legend.title = element_text(size = 10),
    axis.text.x = element_text(size = text.size.x, angle = 0),
    axis.text.y = element_text(size = text.size.y),
    axis.title.x = element_text(size = 10),
    axis.title.y = element_text(size = 10),
    # grids
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.background = element_rect(fill = 'white'),
    # frams
    panel.border = element_blank(),
    # titles
    plot.title = element_text(hjust = 0.5, size = 12),
    plot.margin = margin(t = 15, r = 15, b = 5, l = 5, unit = "pt")
  )
  rawdata$xlabel <- factor(rawdata$xlabel)
  rawdata$ylabel <- factor(rawdata$ylabel)

  num.x <- length(unique(rawdata$xlabel))
  num.y <- length(unique(rawdata$ylabel))

  ggplot(rawdata) +
    geom_vline(
      xintercept = 1:num.x,
      size = 20, colour = "#E4EDF2", alpha = .5) +
    geom_hline(
      yintercept = 1:num.y,
      linetype = "dashed") +
    geom_point(
      aes(x = as.numeric(xlabel) ,y = as.numeric(ylabel), size = values, fill = xlabel),
      shape = 21, colour = "white"
      ) +
    # scale_size_area(min_siz = 10,max_size = 15) +
    scale_size(range = bubble.size.range) +
    guides(size = FALSE, fill = FALSE, direction = FALSE) +
    theme_void(base_size = 40, base_family = "thefont") +
    temp_theme +
    scale_fill_brewer(palette = 'Spectral') +
    scale_x_continuous('', breaks = 1:num.x, labels = levels(rawdata$xlabel)) +
    scale_y_continuous('', breaks = 1:num.y, labels = levels(rawdata$ylabel))
}
