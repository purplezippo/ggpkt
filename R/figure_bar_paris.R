#' Bar plot with two groups separated
#'
#' @param rawdata A data frame with values in paris, which should contain three
#'  columns names 'num_left','num_right' and 'labs'(the labels of each pairs).
#' @param ishorizontal Boolean value with default of FALSE, used to deside whether
#'   should the figure be plot horizontal.
#' @param labelspan.num The space between num label of bars.
#' @param labelspan.lab The space between labels of bars.
#' @param num.size Size of num label.
#' @param label.size Size of label text.
#' @param decreasing Boolean value with default of FALSE, used to deside whether
#'   the bars should ordered in decrease or not.
#' @param bar.width With of bar.
#' @param colors A vectior contains two values of colors which defines the color
#'   of bars.
#' @param title The title of the figure.
#' @param subtitle.left The title of the bars in the left part.
#' @param subtitle.right The title of the bars in the right part.
#' @example inst/examples/ex-bar_pairs.R
#'
#' @family figures utils
#'
#' @export
fig_pairsbar <- function(
  rawdata, ishorizontal = T, labelspan.num = 1, labelspan.lab = 0.1,
  num.size = 4, label.size = 5, decreasing = T, bar.width = 0.9,
  colors = c('#F1B255', '#51A047'), title = '', subtitle.left = '',
  subtitle.right = ''
  ){
  set_fonts()

  rawdata <- rawdata[order(rawdata$num_left, decreasing = decreasing),]
  rawdata$id <- 1:nrow(rawdata)

  pl <-
    ggplot(rawdata) +
    geom_bar(aes(x = id, y = -num_left), stat = "identity", fill = colors[1],
             colour = NA, width = bar.width) +
    geom_text(aes(x = id, y = -num_left - labelspan.num, label = num_left),
              size = num.size, fontface = "bold") +
    theme_void() +
    ylim(-max(rawdata$num_left) - labelspan.num, 0) +
    scale_x_reverse()

  pr <-
    ggplot(rawdata) +
    geom_bar(aes(x = id, y = num_right), stat = "identity", fill = colors[2],
             colour = NA, width = bar.width) +
    geom_text(aes(x = id, y = -labelspan.lab, label = labs),
              vjust = .5, size = label.size) +
    geom_text(aes(x = id, y = num_right + labelspan.num, label = num_right),
              size = num.size, fontface = "bold") +
    theme_void() +
    ylim(-labelspan.lab, max(rawdata$num_right) + labelspan.num) +
    scale_x_reverse()

  grid.newpage()
  vplayout <- function(x,y){viewport(layout.pos.row = x, layout.pos.col = y)}

  if (!ishorizontal) {
    pushViewport(viewport(layout = grid.layout(15,24)))
    if (any(c(title, subtitle.left, subtitle.right) == '')) {
      print(pl, vp = vplayout(8:15, 1:24))
      print(pr, vp = vplayout(1:7, 1:24))
    } else {
      print(pl, vp = vplayout(9:15, 3:24))
      print(pr, vp = vplayout(2:8, 3:24))
    }
    grid.text(
      label = title, x = .50, y = .95,
      gp = gpar(col = "black", fontsize = 20, fontfamily = "thefont", draw = TRUE,
                just = "centre")
    )
    grid.text(
      label = subtitle.right, x = .05, y = .70, rot = 90,
      gp = gpar(col = "black", fontsize = 15, fontfamily = "thefont", draw = TRUE,
                just = "centre")
    )
    grid.text(
      label = subtitle.left, x = .05, y = .27, rot = 90,
      gp = gpar(col = "black", fontsize = 15, fontfamily = "thefont", draw = TRUE,
                just = "centre")
    )

  } else {
    pl <- pl + coord_flip()
    pr <- pr + coord_flip()
    pushViewport(viewport(layout = grid.layout(7,11)))
    if (any(c(title, subtitle.left, subtitle.right) == '')) {
      print(pl, vp = vplayout(1:7,1:5))
      print(pr, vp = vplayout(1:7,6:11))
    } else {
      print(pl, vp = vplayout(2:7,1:5))
      print(pr, vp = vplayout(2:7,6:11))
    }

    grid.text(
      label = title, x = .50, y = .95,
      gp = gpar(col = "black", fontsize = 20, fontfamily = "thefont", draw = TRUE,
                just = "centre")
    )
    grid.text(
      label = subtitle.right, x = .75, y = .88,
      gp = gpar(col = "black", fontsize = 15, fontfamily = "thefont", draw = TRUE,
                just = "centre")
    )
    grid.text(
      label = subtitle.left, x = .25, y = .88,
      gp = gpar(col = "black", fontsize = 15, fontfamily = "thefont", draw = TRUE,
                just = "centre")
    )
  }

}



