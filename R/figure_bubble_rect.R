#' Bubble Graph
#'
#' This function gives a way to draw a point matrix, with both the x and y axises
#' are discrete variables and map the values to the size of points.
#'
#' @param rawdata
#' @param text.size.x
#' @param text.size.y
#' @param palette
#' @param bubble.size.range
#'
#' @example inst/examples/ex-bubble_rect.R
#'
#' @export
fig_bubble_rect <- function(
  rawdata, text.size.x = 12, text.size.y = 12, palette = 'Spectral',
  bubble.size.range = c(3, 15)){
  temp_theme <- theme_light() + theme(
    # 字体
    title = element_text(size = 15, colour = 'black'),
    legend.text = element_text(size = 8),
    legend.title = element_text(size = 10),
    axis.text.x = element_text(size = text.size.x, angle = 0),
    axis.text.y = element_text(size = text.size.y),
    axis.title.x = element_text(size = 10),
    axis.title.y = element_text(size = 10),
    # 网格线
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.background = element_rect(fill = 'white'),
    # 边框
    panel.border = element_blank(),
    ##标题
    plot.title = element_text(hjust = 0.5, size = 12)
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