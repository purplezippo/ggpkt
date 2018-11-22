rawdata <- data.frame(
  values = c(220, 313, 393.4, 423.4, 583.4, 623.4, 823.4,
             934.5, 985.6),
  types = letters[1:9],
  labels = c(
    'proto type', 'fine tuning', 'model optimization', 'model training', 'business research',
    'file research', 'data collection(spyder、document literature、online、offline)',
    'analysis system development(UI design, data base design, model deploy, model apply)', 'data clean'),
  stringsAsFactors = FALSE
)
fig_halfcircles(rawdata, title = 'Time Consuming in Data Analysis Projects', subtitle = 'hours',
                caption = 'Note: these datas are all made out of whole cloth.')


rawdata <- data.frame(
  values = c(220, 313, 393.4, 423.4, 583.4, 623.4, 823.4,
             934.5, 985.6),
  types = c('a','a','a','a','a','a', 'b', 'a', 'a'),
  labels = c(
    'proto type', 'fine tuning', 'model optimization', 'model training', 'business research',
    'file research', 'data collection(spyder、document literature、online、offline)',
    'analysis system development(UI design, data base design, model deploy, model apply)', 'data clean'),
  stringsAsFactors = FALSE
)
fig_halfcircles_emph(rawdata, title = 'Time Consuming in Data Analysis Projects', subtitle = 'hours',
                     caption = 'Note: these datas are all made out of whole cloth.')

