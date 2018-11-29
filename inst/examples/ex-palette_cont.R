library(scales)

# get colours by location
pal <- pal_red_cont()
cols <- pal(c(0.1, 0.3, 0.5, 0.7, 0.9))
plot(1, 1, xlim = c(0, 6), ylim = c(0, 6), type = "n", axes = FALSE,
     bty = "n", xlab = "", ylab = "")
rect(xleft = 0:4, ybottom = 3, xright = 1:5, ytop = 4, col = cols,
     border = "light grey")

# get colours by number
pal <- pal_red_cont(isseq = FALSE)
cols <- pal(5)
plot(1, 1, xlim = c(0, 6), ylim = c(0, 6), type = "n", axes = FALSE,
     bty = "n", xlab = "", ylab = "")
rect(xleft = 0:4, ybottom = 3, xright = 1:5, ytop = 4, col = cols,
     border = "light grey")
