#' Add Marks
#'
#' Include logo, copyright statement and watermarks.
#'
#' @param ggobj A ggplot object.
#' @param logo.size Controls the size of logo image.
#' @param logo.loc Coordinates of the center point, which controls the position of logo image.
#' @param angle The angle of text.
#' @param text Character to add to the figure.
#' @param col Colour for text.
#' @param alpha Alpha channel for transparency
#' @export
add_logo <- function(ggobj, logo.size = 0.1, logo.loc = c(0.5, 0.5)){
  logo <- png::readPNG('figure/logo.png')
  grid.newpage()
  print(ggobj)
  vp <- viewport(x = logo.loc[1], y = logo.loc[2], width = logo.size, height = logo.size)
  grid.raster(logo, vp = vp)

}


#' @rdname add_logo
#'
#' @inheritParams grid::viewport
#'
#' @export
add_copyright <- function(
  ggobj, just = c('center', 'bottom'), text = 'copyright: www.yikdata.com',
  col = 'black'
  ){
  grid.newpage()
  print(ggobj)
  pushViewport(viewport(y = 0,width = 1, height = 0.05, angle = 0, just = just))
  grid.text(text, gp = gpar(col = col))
}


#' @rdname add_logo
#'
#' @export
add_watermark <- function(ggobj, text = 'www.yikdata.com', angle = 0, alpha = 0.4){
  grid.newpage()
  print(ggobj)
  for (i in seq(0.20, 1, 0.3)) {
    for (j in seq(0.20, 1, 0.3)) {
      vp <- viewport(x = i, y = j, width = 0.3, height = 0.1, angle = angle, just = c('center', 'center'))
      grid.text(text, gp = gpar(alpha = alpha), vp = vp)
    }
  }

}

