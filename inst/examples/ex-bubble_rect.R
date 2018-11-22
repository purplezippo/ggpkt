numx <- 10
numy <- 7
rawdata <- data.frame(
  xlabel = rep(paste(letters[1:numx], 'x', sep = '-'), numy),
  ylabel = rep(paste(letters[1:numy], 'y', sep = '-'), each = numx),
  values = runif(numx*numy, min = 5, max = 30)
)

fig_bubble_rect(rawdata)
