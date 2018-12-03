#' YIK academic color scales
#'
#' Color scales using the colors in the academic scenes.
#'
#' @inheritParams ggplot2::scale_colour_hue
#' @inheritParams pal_academic
#'
#' @family colour academic
#' @rdname scale_academic
#' @seealso \code{\link{theme_yk_academic_light}()} for examples.
#' @export
scale_colour_academic_light <- function(...) {
  discrete_scale("colour", "academic", pal_academic(isdark = FALSE), ...)
}

#' @rdname scale_academic
#' @export
scale_color_academic_light <- scale_colour_academic_light

#' @rdname scale_academic
#' @export
scale_colour_academic_dark <- function(...) {
  discrete_scale("colour", "academic", pal_academic(isdark = TRUE), ...)
}

#' @rdname scale_academic
#' @export
scale_color_academic_dark <- scale_colour_academic_dark

#' @rdname scale_academic
#' @export
scale_fill_academic_light <- function(...) {
  discrete_scale("fill", "academic", pal_academic(isdark = FALSE), ...)
}

#' @rdname scale_academic
#' @export
scale_fill_academic_dark <- function(...) {
  discrete_scale("fill", "academic", pal_academic(isdark = TRUE), ...)
}

#~~~~~~~~~~~~~~~ themes ~~~~~~~~~~~~~~#-------------------------------------####

#' ggplot color theme for academic files
#'
#' Themes that can be used in \emph{academic} scenes.
#'
#' @inheritParams ggplot2::theme_grey
#' @return An object of class \code{\link[ggplot2]{theme}()}.
#'
#' @rdname theme_yk_academic
#' @family themes
#'
#' @details
#' \describe{
#'
#'
#' \item{`theme_yk_academic_common`}{
#' The signature yik-academic theme.
#' }
#'
#' \item{`theme_yk_academic_brief`}{
#' A theme in designed to show figures in a brief way.
#' }
#'
#' \item{`theme_yk_academic_light`}{
#' A theme like `theme_yk_academic_common`.
#' }
#'
#' \item{`theme_yk_academic_dark`}{
#' A theme with dark apperence, in the opposit of `theme_yk_academic_light`.
#' }
#'
#' \item{`theme_yk_academic_dotted_gray`}{
#' A theme with only dotted horizontal grid lines and light background.
#' }
#'
#' }
#'
#' @name theme_yk_academic
#'
#' @example inst/examples/ex-theme_academic.R
#' @export
theme_yk_academic_light <- function(base_size = 10, base_family = "") {
  theme_light() + theme(
    # font
    title = element_text(family = base_family, size = 15, colour = 'black'),

    ##axis
    axis.ticks = element_line(size = 0.3),
    axis.title = element_text(colour = "gray10"),
    axis.text = element_text(size = 18, colour = "gray10"),
    axis.text.x = element_text(family = base_family, size = base_size, angle = 0),
    axis.text.y = element_text(family = base_family, size = base_size),
    axis.title.x = element_text(family = base_family, size = base_size),
    axis.title.y = element_text(family = base_family, size = base_size),

    # grid line
    panel.grid.major.x = element_line(size = .2),
    panel.grid.minor.x = element_line(size = .2, linetype = 'dotdash'),
    panel.grid.major = element_line(
      colour = "gray77",  size = 0.4, linetype = "dashed"
      ),
    panel.grid.minor = element_line(
      colour = "gray77",  size = 0.4, linetype = "blank"
      ),
    panel.background = element_rect(fill = 'white'),

    # frame
    panel.border = element_blank(),

    # legend
    legend.position = 'right',
    legend.text = element_text(size = 8),
    legend.title = element_text(size = 10),

    plot.title = element_text(hjust = 0.5, size = 12)
  )
}


#' @rdname theme_yk_academic
#' @export
theme_yk_academic_dark <- function(base_size = 10, base_family = ""){
  theme_light() + theme(
    title = element_text(family = base_family, size = 15, colour = 'black'),

    axis.line = element_line(colour = "gray30"),
    axis.ticks = element_line(size = 1),
    axis.title = element_text(colour = "whitesmoke"),
    axis.text = element_text(size = 20, colour = "whitesmoke"),
    axis.text.x = element_text(family = base_family, size = base_size, angle = 0),
    axis.text.y = element_text(family = base_family, size = base_size),
    axis.title.x = element_text(family = base_family, size = base_size),
    axis.title.y = element_text(family = base_family, size = base_size),

    panel.grid.major.x = element_line(size = .2),
    panel.grid.minor.x = element_line(size = .2, linetype = 'dotdash'),
    panel.grid.major = element_line(
      colour = "gray90",  size = 0.2, linetype = "dashed"
      ),
    panel.grid.minor = element_line(
      colour = "gray90",  size = 0.2, linetype = "blank"
      ),
    panel.background = element_rect(fill = NA),

    plot.background = element_rect(fill = "gray30", colour = NA),

    panel.border = element_blank(),

    legend.key = element_rect(fill = "gray30"),
    legend.background = element_rect(fill = "gray30"),
    legend.position = 'right',
    legend.text = element_text(size = 8, colour = "whitesmoke"),
    legend.title = element_text(size = 10, colour = "whitesmoke"),

    plot.title = element_text(hjust = 0.5, size = 12, colour = "whitesmoke")
  )
}


#' @rdname theme_yk_academic
#' @export
theme_yk_academic_dotted_gray <- function(base_size = 10, base_family = ""){
  theme_light() + theme(
    # 字体
    title = element_text(family = base_family, size = base_size + 5, colour = 'black'),
    plot.background = element_rect(fill = "whitesmoke",   colour = NA),
    ##坐标轴
    axis.line = element_line(colour = NA, size = 0.25, linetype = "dotted"),
    axis.ticks = element_line(colour = "black", size = 0.25, linetype = "dotted"),
    axis.title = element_text(colour = NA),
    axis.text = element_text(size = 18, colour = "gray30"),
    axis.text.x = element_text(family = base_family, size = base_size, angle = 0),
    axis.text.y = element_text(family = base_family, size = base_size),
    axis.title.x = element_text(family = base_family, size = base_size),
    axis.title.y = element_text(family = base_family, size = base_size),
    # 网格线
    panel.grid.major.x = element_line(size = .2),
    panel.grid.minor.x = element_line(size = .2, linetype = 'dotdash'),
    panel.grid.major = element_line(
      colour = "gray55", size = 0.3, linetype = "dotted"
      ),
    panel.grid.minor = element_line(
      colour = "gray55", size = 0.3, linetype = "blank"
      ),
    panel.background = element_rect(
      fill = 'whitesmoke',colour = "gray58",size = 0.3, linetype = "dotted"
      ),
    # 边框
    panel.border = element_blank(),  # 无边框
    # 图例
    legend.position = 'right',
    legend.text = element_text(size = base_size - 2),
    legend.title = element_text(size = base_size),
    legend.key = element_rect(fill = "whitesmoke"),
    legend.background = element_rect(fill = "whitesmoke"),
    ##标题
    plot.title = element_text(hjust = 0.5, size = base_size + 2)
  )
}


#' @rdname theme_yk_academic
#' @export
theme_yk_academic_brief <- function(base_size = 10, base_family = ""){
  theme_light() + theme(
    plot.caption = element_text(colour = "gray28"),
    axis.line = element_line(),
    axis.ticks = element_line(colour = NA, linetype = "blank"),
    axis.line.y = element_blank(),
    panel.border = element_blank(),
    panel.grid.major = element_line(colour = NA),
    panel.grid.minor = element_line(colour = NA),
    plot.background = element_rect(fill = "white", colour = NA)
    )
}


#' @rdname theme_yk_academic
#' @export
theme_yk_academic_common <- function(base_size = 10, base_family = ""){
  theme_light() + theme(
    # 字体
    title = element_text(family = base_family, size = base_size + 5, colour = 'black'),
    ##坐标轴
    axis.line = element_line(colour = "gray70", size = 0.6, linetype = "solid"),
    axis.ticks = element_line(size = 0.3),
    axis.title = element_text(colour = "black",hjust = 1),
    axis.text = element_text(size = 18, colour = "gray10"),
    axis.text.x = element_text(family = base_family, size = base_size, angle = 0),
    axis.text.y = element_text(family = base_family, size = base_size),
    axis.title.x = element_text(family = base_family, size = base_size),
    axis.title.y = element_text(family = base_family, size = base_size),
    # 网格线
    panel.grid.major.x = element_line(size = .2),
    panel.grid.minor.x = element_line(size = .2, linetype = 'dotdash'),
    panel.grid.major = element_line(colour = NA),
    panel.grid.minor = element_line(colour = NA),
    panel.background = element_rect(fill = 'white'),
    # 边框
    panel.border = element_blank(),
    # 图例
    legend.position = 'right',
    legend.text = element_text(size = base_size - 2),
    legend.title = element_text(size = base_size),
    ##标题
    plot.title = element_text(hjust = 0.5, size = base_size + 2)
  )
}
