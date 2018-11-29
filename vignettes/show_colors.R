## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 7, fig.height = 7, fig.align = "center")
library(scales)
library(RColorBrewer)

## ----cars----------------------------------------------------------------
n <- 10
rainbow(n, s = 1, v = 1, start = 0, end = max(1, n - 1)/n, alpha = 1)
heat.colors(n, alpha = 1)
terrain.colors(n, alpha = 1)
topo.colors(n, alpha = 1)
cm.colors(n, alpha = 1)


## ----pressure------------------------------------------------------------
show_col(rainbow(10),labels = T)

## ------------------------------------------------------------------------
oblue <- colorRampPalette(c("orange", "blue"))
show_col(oblue(10),labels = T)

## ------------------------------------------------------------------------
n <- 200
temp.col <- oblue(n)
par(mar = c(0.5,0.5,2,0.5))
barplot(rep(1,times = n),col = temp.col, border = temp.col, horiz = F, axes = FALSE)


## ------------------------------------------------------------------------
head(colors(), 12)

## ------------------------------------------------------------------------
show_col(colours(), labels = F)

## ----eval=FALSE----------------------------------------------------------
#  display.brewer.all(type = "all")

## ------------------------------------------------------------------------
display.brewer.all(type = "seq")  


## ------------------------------------------------------------------------
display.brewer.all(type = "div")  

## ------------------------------------------------------------------------
display.brewer.all(type = "qual")  

## ------------------------------------------------------------------------
cols <- brewer_pal(palette = "Greens")(5)
cols

## ------------------------------------------------------------------------
cols <- brewer_pal("div")(5)
show_col(gradient_n_pal(cols)(seq(0, 1, length.out = 30)))


