#' Event Storm
#'
#' This function create a figure which discribes the time spent during different
#' stages in different events.
#'
#' @param rawdata A \code{data.frame} with five columns: event_id, integer vector
#' identify each event; event_label, the label of each event, not necessary if \code{isxtext}
#' is set to FALSE; stage_label, labels of stages during a whole event; start_time,
#' beginning of each stage; end_time, end of each of each satge;
#' @param palette Character value, name of a palette. IF palette is given, the parameter
#' colours won't be use.
#' @param colours A vector gives out the colours.
#' @param line.size Size of each event.
#' @param angle Numeric value between 0 and \code{pi*2}, controls the direction of
#' the figure.
#' @param expand Numeric value controls the space between start and end.
#' @param isxtext Whether to add text at start positoion.
#' @param hjust.xtext A numeric vector with length two, controls the position of
#' text, only valid if isxtext is set to TRUE.
#' @param islegend Whether to add legend to the figure.
#' @param legend.size Size of legend key.
#'
#' @example inst/examples/ex-event_storm.R
#'
#' @family figure
#'
#' @export
fig_event_storm <- function(
  rawdata,
  palette = NULL,
  colours = NULL,
  line.size = 3,
  angle = 0, # 0~ 2*pi
  expand = 0.08,
  isxtext = FALSE,
  hjust.xtext = c(-0.5, 0.6),
  islegend = TRUE,
  legend.size = 8
  ){
  if (!all(c('event_id', 'stage_label','start_time', 'end_time') %in% names(rawdata))) {
    stop('Error: not all required columns exits.')
  }

  rawdata$stage_label <- fac_raworder(factor(rawdata$stage_label))

  min.id.loc <- which.min(rawdata$event_id)
  max.id.loc <- which.max(rawdata$event_id)
  min.time.loc <- which.min(rawdata$start_time)

  pic <-
  ggplot(rawdata) +
    geom_linerange(
      aes(x = event_id, ymin = start_time, ymax = end_time, col = stage_label),
          size = line.size, alpha = .8
      ) +
    theme(
      panel.background = element_rect(fill = "white"),
      panel.spacing = unit(-0.3,"cm"),
      axis.title = element_blank(),
      axis.text.x = element_text(margin = margin(5,0,0,0,"pt")),
      axis.text.y = element_text(),
      axis.ticks.x = element_line(size = 3),
      axis.text = element_text(colour = "black", size = 10, face = "bold"),
      axis.line.x = element_blank(),
      axis.line.y = element_blank()
    ) +
    guides(
      color = guide_legend(
        override.aes = list(size = legend.size), keyheight = 1, title = NULL
        )
    ) +
    scale_x_discrete(expand = expand_scale(mult = c(0.3, 0))) +
    scale_y_discrete(expand = expand_scale(mult = c(0.0, expand))) +
    coord_polar(theta = 'y', start = angle)

  if (!is.null(palette)) {
    pic <- pic + scale_color_brewer(palette = palette)
  } else if (!is.null(colours)) {
    pic <- pic + scale_color_manual('', values = colours)
  }

  if (isxtext) {
    if (!('event_label' %in% names(rawdata))) stop('Error: event_label not found.')
    pic <- pic +
      geom_text(
        aes(x = rawdata$event_id[min.id.loc] + hjust.xtext[1],
            y = rawdata$start_time[min.time.loc] + 4,
            label = rawdata$event_label[min.id.loc])
      ) +
      geom_text(
        aes(x = rawdata$event_id[max.id.loc] + hjust.xtext[2],
            y = rawdata$start_time[min.time.loc] + 1,
            label = rawdata$event_label[max.id.loc])
      )
  }

  if (!islegend) {
    pic <- pic + theme(legend.position = 'none')
  }

  pic
}
