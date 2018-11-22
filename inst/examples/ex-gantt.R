rawdata <- data.frame(
  works =
    c('Requirements Analysis and Validation', 'Alogrithm 1', 'Alogrithm 2',
      'Alogrithm 3', 'Build System Framwork', 'System Development',
      'Data Base', 'System Deployment', 'Test Run', 'Acceptance'
      ),
  start_time = as.Date(
    c('2018-01-01', '2018-01-20','2018-02-15','2018-03-20', '2018-04-01',
      '2018-05-01','2018-06-30','2018-08-01', '2018-09-01','2018-10-30')
    ),
  end_time = as.Date(
    c('2018-01-19', '2018-02-14', '2018-03-19', '2018-03-31', '2018-04-29',
      '2018-06-29', '2018-07-31', '2018-08-31', '2018-10-29', '2018-11-08')
    ),
  start_time_real = as.Date(
    c('2018-01-02', '2018-01-21', '2018-02-17', '2018-03-25', '2018-04-01',
      '2018-05-02', '2018-06-28', '2018-08-01', '2018-09-05', '2018-10-29')
    ),
  end_time_real = as.Date(
    c('2018-01-20', '2018-02-16', '2018-03-24', '2018-03-31', '2018-05-01',
      '2018-06-27', '2018-07-31', '2018-09-04', '2018-10-28', '2018-11-07')
    ),
  stringsAsFactors = FALSE
  )

fig_gantt(rawdata)

fig_gantt(rawdata[, c('works', 'start_time', 'end_time')])

fig_gantt(rawdata[, c('works', 'start_time_real', 'end_time_real')],
          type = 'real', colors.rect = 'red')

fig_gantt(rawdata[, c('works', 'start_time_real', 'end_time_real')],
          type = 'real', colors.rect = 'red', islegend = FALSE)
