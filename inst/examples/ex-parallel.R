library(reshape2)
rawdata <- iris
rawdata$id <- 1:nrow(iris)
rawdata <- melt(rawdata, id = c('id','Species'))

names(rawdata) <- c('id', 'group', 'variable', 'value')

fig_parallel(rawdata)

fig_parallel(rawdata, alpha = 0.3, add.point = TRUE)

fig_parallel(rawdata, alpha = 0.3, add.point = TRUE) +
  coord_polar()
