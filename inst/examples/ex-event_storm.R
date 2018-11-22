
# build test data
step.num <- 7
num <- 40

base_time <- as.Date(
  c('2018-01-01','2018-02-20', '2018-04-12', '2018-05-13','2018-06-30',
    '2018-08-01', '2018-09-29', '2018-12-31')
  )

biase <- sin(seq(0, 3, length.out = num))

start_time <- c()
end_time <- c()
for (i in 1:num) {
  temp <- base_time[-1] + round(abs(rnorm(step.num, 20*biase[i], 0.2)))
  temp <- c(base_time[1], temp)
  start_time <- c(start_time, temp[1:step.num])
  end_time <- c(end_time, temp[-1])
}
rawdata <- data.frame(
  event_id = rep(1:num, each = step.num),
  event_label = rep(1:num, each = step.num),
  stage_label = rep(c(
      'Requirements Analysis and Validation',
      'Alogrithm', 'Build System Framwork', 'System Development',
      'Data Base', 'System Deployment', 'Test Run'
    ), num),
  start_time = start_time,
  end_time = end_time,
  stringsAsFactors = FALSE
)

head(rawdata)

# plot the figure
fig_event_storm(rawdata)


fig_event_storm(rawdata, islegend = FALSE)
