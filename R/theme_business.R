#' YIK business color scales
#'
#' Color scales using the colors in the business scenes.
#'
#' @inheritParams ggplot2::scale_colour_hue
#' @inheritParams pal_business
#' @family colour business
#' @rdname scale_business
#' @seealso \code{\link{theme_yk_business_light}()} for examples.
#' @export
scale_colour_business_light <- function(...) {
  discrete_scale("colour", "business", ggpkt::pal_business(isdark = FALSE), ...)
}

#' @rdname scale_business
#' @export
scale_color_business_light <- scale_colour_business_light

#' @rdname scale_business
#' @export
scale_colour_business_dark <- function(...) {
  discrete_scale("colour", "business", ggpkt::pal_business(isdark = TRUE), ...)
}

#' @rdname scale_business
#' @export
scale_color_business_dark <- scale_colour_business_dark

#' @rdname scale_business
#' @export
scale_fill_business_light <- function(...) {
  discrete_scale("fill", "business", ggpkt::pal_business(isdark = FALSE), ...)
}

#' @rdname scale_business
#' @export
scale_fill_business_dark <- function(...) {
  discrete_scale("fill", "business", ggpkt::pal_business(isdark = TRUE), ...)
}

#~~~~~~~~ continuous scale ~~~~~~~~~#--------------------------------------####


#~~~~~~~~~~~~~~ theme ~~~~~~~~~~~~~~~#--------------------------------------####

#' ggplot color theme for bussiness files
#'
#' A theme that can be used in \emph{bussiness} scenes.
#'
#' Use \code{\link{scale_color_business_light}()} with this theme.
#'
#' @inheritParams ggplot2::theme_grey
#' @return An object of class \code{\link[ggplot2]{theme}()}.
#' @rdname theme_yk_business
#' @name theme_yk_business
#' @family themes
#'
#' @details
#' \describe{
#'
#' \item{`theme_yk_business_light`}{
#' The signature yik-business theme.
#' }
#'
#' \item{`theme_yk_business_dark`}{
#' The opposit of theme `theme_yk_business_light`
#' }
#'
#' \item{`theme_yk_business_brief`}{
#' A theme in designed to show figures in a brief way.
#' }
#'
#' \item{`theme_yk_business_light_solid`}{
#' A theme similar to `theme_yk_business_light` but with solid lines.
#' }
#'
#' \item{`theme_yk_business_dotted_lightblue`}{
#' A theme with dotted grid lines and light blue background.
#' }
#'
#' \item{`theme_yk_business_blue`}{
#' A theme with blue background.
#' }
#'
#' }
#'
#' @example inst/examples/ex-theme_business.R
#' @export
theme_yk_business_brief <- function(base_size = 8, base_family = ""){
  theme_light() + theme(
    plot.caption = element_text(colour = "gray28"),
    axis.title = element_text(colour = NA, family = base_family),
    axis.line = element_blank(),
    axis.ticks = element_line(colour = NA, linetype = "blank"),
    axis.text.y = element_text(colour = "white", size = base_size),
    panel.border = element_blank(),
    panel.grid.major = element_line(colour = NA),
    panel.grid.minor = element_line(colour = NA),
    plot.background = element_rect(fill = "white", colour = NA)
  )
}


#' @rdname theme_yk_business
#' @export
theme_yk_business_light <- function(base_size = 10, base_family = "") {
  theme(
    axis.title = element_text(family = base_family, size = 11, color = "black"),
    axis.text = element_text(
      family = base_family, size = 10, color = "black", hjust = 0.5, vjust = 0.5
    ),
    legend.text = element_text(
      family = base_family, size = 10, color = "black", vjust = 1
    ),
    legend.title = element_text(family = base_family, size = 11, color = "black"),
    ## 网格线
    panel.border = element_blank(),
    panel.background = element_rect(fill = "white"),
    panel.grid = element_line(colour = NULL, linetype = 3),
    panel.grid.major = element_line(colour = "black"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    ## 标题
    plot.title = element_text(
      family = base_family, hjust = 0.5, size = 12, color = "black", face = "bold"
    ),
    ## 坐标轴
    axis.ticks.y = element_blank(),
    axis.ticks.x = element_line(colour = NULL),
    axis.line = element_line(),
    axis.line.y = element_blank(),
    ## 图例
    legend.key.size = unit(c(0.4), "cm"),
    legend.key = element_rect(fill = "white")
  )
}


#' @rdname theme_yk_business
#' @export
theme_yk_business_dark <- function(base_size = 10, base_family = "") {
  theme(
    axis.title = element_text(family = base_family, size = 11, color = "white"),
    axis.text = element_text(family = base_family, size = 9, color = "white"),
    legend.text = element_text(
      family = base_family, size = 9,
      color = "white", vjust = 1
    ),
    legend.title = element_text(family = base_family, size = 10, color = "white"),
    ## 网格线
    panel.border = element_blank(),
    panel.background = element_rect(fill = "grey20"),
    plot.background = element_rect(fill = "grey20"),
    panel.grid = element_line(colour = NULL, linetype = 3),
    panel.grid.major = element_line(colour = "white"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    ## 标题
    plot.title = element_text(
      family = base_family, hjust = 0.5,
      size = 12, color = "white", face = "bold"
    ),
    ## 坐标轴
    axis.ticks.y = element_blank(),
    axis.ticks.x = element_line(colour = "white"),
    axis.line = element_line(colour = "white"),
    axis.line.y = element_blank(),
    legend.key.size = unit(c(0.4), "cm"),
    legend.key = element_rect(fill = "grey20", colour = "grey20"),
    legend.background = element_rect(fill = "grey20", color = "grey20"),
    legend.box.background = element_rect(fill = "grey20")
  )
}


#' @rdname theme_yk_business
#' @export
theme_yk_business_light_solid <- function(base_size = 10, base_family = "") {
  theme(
    axis.title = element_blank(),
    axis.text = element_text(
      family = base_family, size = base_size, color = "black", hjust = 0.5,
      vjust = 0.5
      ),
    ## 网格线
    panel.border = element_blank(),
    panel.background = element_rect(fill = "white"),
    panel.grid = element_line(colour = NULL, linetype = 1, size = 0.2),
    panel.grid.major = element_line(colour = "black"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    ## 标题
    plot.title = element_text(
      family = base_family, hjust = 0.5, size = base_size + 2, color = "black",
      face = "bold"
      ),
    ## 坐标轴
    axis.ticks = element_line(linetype = "blank"),
    axis.line = element_line(linetype = 1, size = 0.2),
    axis.line.y = element_blank(),
    ## 图例
    legend.key.size = unit(c(0.4), "cm"),
    legend.key = element_rect(fill = NA),
    legend.position = "bottom",
    legend.direction = "horizontal",
    legend.text = element_text(
      family = base_family, size = base_size, color = "black", vjust = 1
      ),
    legend.title = element_text(
      family = base_family, size = base_size + 1, color = "black"
      )
    )
}


#' @rdname theme_yk_business
#' @export
theme_yk_business_dotted_lightblue <- function(base_size = 10, base_family = "") {
  theme(
    axis.title = element_text(colour = "aliceblue"),
    axis.text = element_text(
      family = base_family, size = base_size, color = "black", hjust = 0.5,
      vjust = 0.5
      ),
    axis.text.y = element_text(colour = "aliceblue"),

    panel.border = element_blank(),

    panel.grid = element_line(color = "gray58", linetype = "dotted", size = 0.7),
    panel.grid.major = element_line(colour = "black"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),

    plot.title = element_text(
      family = base_family, hjust = 0.5, size = base_size + 2, color = "black",
      face = "bold"
      ),
    plot.background = element_rect(fill = "aliceblue", colour = "aliceblue"),
    panel.background = element_rect(fill = "aliceblue", colour = "aliceblue"),

    axis.ticks = element_line(colour = "gray70", size = 1.6, linetype = "dashed"),
    axis.line = element_blank(),

    legend.key.size = unit(c(0.4), "cm"),
    legend.key = element_rect(fill = "aliceblue", colour = "aliceblue"),
    legend.position = "bottom",
    legend.direction = "horizontal",
    legend.text = element_text(
      family = base_family, size = base_size,  color = "black", vjust = 1
      ),
    legend.title = element_text(
      family = base_family, size = base_size + 1, color = "black"
      ),
    legend.background = element_rect(fill = "aliceblue", color = "aliceblue"),
    legend.box.background = element_rect(fill = "aliceblue")
    )
}


#' @rdname theme_yk_business
#' @export
theme_yk_business_blue <- function(base_size = 10, base_family = "") {
  theme(
    axis.title = element_text(colour = "aliceblue",hjust = 1),
    axis.text = element_text(
      family = base_family, size = base_size, colour = NA, hjust = 0.5,
      vjust = 0.5
      ),
    axis.text.y = element_text(colour = "white"),
    axis.text.x = element_text(colour = "white"),
    ## 网格线
    panel.border = element_blank(),
    panel.grid = element_line(color = "gray28", linetype = 1, size = 0.7),
    panel.grid.major = element_line(colour = NA, linetype = "blank"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_line(linetype = "blank"),
    ## 标题
    plot.title = element_text(
      family = base_family, hjust = 0.5, size = base_size + 3, color = "gray77",
      face = "plain"
      ),
    plot.caption = element_text(vjust = 1),
    plot.background = element_rect(fill = "#3c5d89", colour = "#3c5d89"),
    panel.background = element_rect(
      fill = "#3c5d89", colour = "gray77",  size = 0.5, linetype = "solid"
      ),
    ## 坐标轴
    axis.ticks = element_line(colour = "gray70", size = 3.2, linetype = "blank"),
    axis.line =  element_line(colour = "gray77",  size = 0.5, linetype = "solid"),

    ## 图例
    legend.key.size = unit(c(0.4), "cm"),
    legend.key = element_rect(fill = "white",  colour = NA),
    legend.text = element_text(
      family = base_family, size = base_size,  colour = "gray92", vjust = 1
      ),
    legend.title = element_text(
      family = base_family, size = base_size + 1, color = "gray92"
      ),
    legend.background = element_rect(
      fill = "#3c5d89", colour = "#3c5d89", linetype = "solid"
      ),
    legend.box.background = element_rect(fill = "#3c5d89")
    )

}