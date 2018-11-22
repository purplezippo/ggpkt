
# 1 month
rawdata <- data.frame(
  dates = seq(as.Date('2018-01-01'), length.out = 20, by = '1 day'),
  values = rnorm(20)
)
# fig_calendar(
#   rawdata,
#   na.col = 'grey90', val.col = 'grey80',
#   mar.fill = 'white', mar.col = 'grey80',
#   strip.text.size = 18, strip.text.hjust = 0.5,
#   axis.x.size = 12, isfull = TRUE, islegend = FALSE
# )

# 6 months
num <- 180
# rawdata <- data.frame(
#   dates = seq(as.Date('2018-01-01'), length.out = num, by = '1 day'),
#   values = round(rnorm(num), 3)
# )
# fig_calendar(rawdata, isfull = TRUE, na.col = 'grey80', val.col = 'grey80',
#              mar.fill = 'white', mar.col = 'grey80')

# add value tag
# fig_calendar(
#   rawdata,
#   na.col = 'grey90', val.col = 'grey80',
#   mar.fill = 'white', mar.col = 'grey80',
#   strip.text.size = 18, strip.text.hjust = 0.5,
#   axis.x.size = 12, isfull = TRUE, islegend = FALSE,
#   istext = TRUE
# )
#

