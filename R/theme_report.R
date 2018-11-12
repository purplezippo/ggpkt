#' Theme for reports
#'
#' This theme is used for create figures in data analysis reports.
#'
#' @param font.size.legend.title Font size of legend title.
#' @param font.size.legend.text Font size of legend text.
#' @param font.size.axis.x Font size of axis x.
#' @param font.size.axis.y Font size of axis y.
#' @family themes
#' @example inst/examples/ex-theme_report.R
#' @export
theme_rp_light <- function(
  font.size.legend.title = 12, font.size.legend.text = 10,
  font.size.axis.x = 12, font.size.axis.y = 12){
  theme_light() + theme(

    # 字体
    title = element_text(size = 20, colour = 'black'),
    legend.text = element_text(size = font.size.legend.text),
    legend.title = element_text(size = font.size.legend.title),
    axis.text.x = element_text(size = font.size.axis.x, face = "bold"),
    axis.text.y = element_text(size = font.size.axis.y),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    # axis.line.x = element_line(size = 1),

    # 网格线
    panel.grid.major.x = element_line(size = .2),
    panel.grid.minor.x = element_line(size = .2, linetype = 'dashed'),
    panel.grid.major.y = element_line(size = .2),
    panel.grid.minor.y = element_line(size = .2, linetype = 'dashed'),
    panel.background = element_rect(fill = 'white'),

    # 边框
    panel.border = element_blank()
  )
}
