#' Gantt chart
#'
#' This function is designed to create the gantt chart which often used in progress
#' control during projects.
#'
#' @param rawdata A \code{data.frame} which contains five columns with names as
#'   'works', 'start_time', 'end_time', 'start_time_real', 'end_time_real'.The
#'   works is a character vector to instore the names of work steps, tne start_time
#'   stands for the start time in plan, the end_time stands for the end time in plan,
#'   the start_time_real stands for the start time in real while the end_time_real means
#'   the end time in real. All these four columns must be in the data type of \code{Date()}
#'   with the format of 'YYYY-MM-DD'.
#' @param sort_by_works Boolean value, while true the rawdata will be sort by
#'   the column of works.
#' @param colors.rect A named vector with length two, and the default value is
#'   \code{c('plan' = 'grey30', 'real' = 'blue')} which controls the colors of
#'   rects in the figure.
#' @param colors.bg A vector with length two, contains color values which controls
#'  the back groud color of the figure.
#' @param size.plan Control the rect size which stands for time points in plan.
#' @param size.real Control the rect size which stands for time points in real.
#' @param type A character with values of 'plan' or 'real', only valid if the
#'  rawdata only have three columns.
#' @param islegend Boolean value, draw legend or not, with default TRUE.
#' @param legend.size \code{integer} value controls the size of legend.
#'
#' @note If the rawdata contains five columns in the required format, then both
#' the planed work check points and real ones will be plot together. If only one
#' of them is needed then pass the correspond three columns(either be
#' \code{c('works', 'start_time', 'end_time')} or be \code{c('works',
#' 'start_time_real', 'end_time_real')}) and change the value of \code{type}
#'  accordingly.
#'
#' @example inst/examples/ex-gantt.R
#'
#' @family figures
#'
#' @export
fig_gantt <- function(
  rawdata, sort_by_works = T,
  colors.rect = c('grey30', 'blue'),
  colors.bg = c('orange', 'black'),
  size.plan = 12, size.real = 10,
  type = 'plan',
  islegend = T,
  legend.size = 8
  ){
  set_fonts()
  works.num <- nrow(rawdata)
  if (sort_by_works) {
    rawdata$works <- factor(rawdata$works, levels = rawdata$works)
  }

  if (ncol(rawdata) == 5) {
    rawdata.long <- data.frame(
      works = rep(rawdata$works, 2),
      start_time = c(rawdata$start_time, rawdata$start_time_real),
      end_time = c(rawdata$end_time, rawdata$end_time_real),
      types = rep(c('计划', '实际'), each = works.num)
    )
  } else if (ncol(rawdata) == 3) {
    rawdata.long <- data.frame(
      works = rawdata$works,
      start_time = c(rawdata$start_time),
      end_time = c(rawdata$end_time)
    )
    if (type == 'plan') {
      rawdata.long$types = rep(c('计划'), each = works.num)
    } else if (type == 'real') {
      rawdata.long$types = rep(c('实际'), each = works.num)
    }

  }

  # axis breaks and labels
  start.month <-
    paste0(substr(min(rawdata.long$start_time), 1, 8),'01') %>% as.Date()
  temp <- seq(max(rawdata.long$end_time), by = '1 month', length.out = 2)[2]
  end.month <- paste0(substr(temp, 1, 8),'01') %>% as.Date()
  # Date
  time.range <- seq(start.month, end.month, '1 month')
  # yyyymm
  time.labs <- paste0(
    lubridate::year(time.range), sprintf('%02d', lubridate::month(time.range))
    )

  # data for rects
  month.num <- length(time.range)
  rect.df <- data.frame(
    xmin = 0,
    xmax = works.num,
    ymin = time.range[-month.num],
    ymax = time.range[-1]
  )
  rect.df1 <- rect.df[seq(1, month.num, 2),]
  rect.df2 <- rect.df[seq(2, month.num, 2),] %>% na.omit()


  pic <- ggplot() +
    geom_rect(
      data = rect.df1,
      aes(xmin = xmin, xmax = xmax + 1, ymin = ymin, ymax = ymax),
      fill = colors.bg[1],alpha = .08
      ) +
    geom_rect(
      data = rect.df2,
      aes(xmin = xmin, xmax = xmax + 1, ymin = ymin, ymax = ymax),
      fill = colors.bg[2],alpha = .09
      ) +
    theme(
      axis.title = element_blank(),
      axis.text.x = element_text(margin = margin(5,0,0,0,"pt")),
      axis.text.y = element_text(margin = margin(0,10,0,0,"pt")),
      axis.ticks.y = element_blank(),
      panel.background = element_rect(fill = "white"),
      axis.text = element_text(
        colour = "black", size = 10, face = "bold", family = "thefont"
        ),
      axis.line.x = element_line(),
      panel.spacing = unit(-0.3,"cm")
      # legend.key.size = unit(0.1,"cm"),
      # legend.key.width = unit(0.03,"cm")
    ) +
    guides(
      color = guide_legend(override.aes = list(size = legend.size), keyheight = 1, title = NULL)
      ) +
    scale_x_discrete(
      limits = sort(rawdata$works, decreasing = T),
      expand = expand_scale(mult = c(0, 0.1))
      ) +
    scale_y_date(breaks = time.range, labels = time.labs, expand = c(0.05, 0.01)) +
    scale_color_manual('', values = colors.rect) +
    coord_flip()

  if (ncol(rawdata) == 5) {
    pic <- pic +
      geom_linerange(
        data = rawdata.long[rawdata.long$types == '计划',],
        aes(x = works, ymin = start_time, ymax = end_time, color = types),
        size = size.plan, alpha = .5
      ) +
      geom_linerange(
        data = rawdata.long[rawdata.long$types == '实际',],
        aes(x = works, ymin = start_time, ymax = end_time, color = types),
        size = size.real, alpha = .5
      )

  } else if (ncol(rawdata) == 3) {
    if (type == 'plan') {
      pic <- pic +
        geom_linerange(
          data = rawdata.long,
          aes(x = works, ymin = start_time, ymax = end_time, color = types),
          size = size.plan, alpha = .5
        )
    } else {
      pic <- pic +
        geom_linerange(
          data = rawdata.long,
          aes(x = works, ymin = start_time, ymax = end_time, color = types),
          size = size.real, alpha = .5
        )
    }

  }
  if (!islegend) pic = pic + theme(legend.position = 'none')
  pic
}

