rawdata <- data.frame(
  values = c(220, 313, 393.4, 423.4, 583.4, 623.4, 823.4,
             934.5, 985.6),
  types = letters[1:9],
  labels = c(
    '原型构建', '参数调试', '模型优化', '模型训练', '业务理解',
    '资料检索', '数据采集(爬虫、文档、线上、线下)',
    '分析系统开发(UI设计, 数据库设计, 模型部署, 模型应用)', '数据清洗'),
  stringsAsFactors = F
)
fig_halfcircles(rawdata, title = '数据分析各环节耗时', subtitle = 'hours',
                caption = '注：数据纯属虚构')


rawdata <- data.frame(
  values = c(220, 313, 393.4, 423.4, 583.4, 623.4, 823.4,
             934.5, 985.6),
  types = c('a','a','a','a','a','a', 'b', 'a', 'a'),
  labels = c(
    '原型构建', '参数调试', '模型优化', '模型训练', '业务理解',
    '资料检索', '数据采集(爬虫、文档、线上、线下)',
    '分析系统开发(UI设计, 数据库设计, 模型部署, 模型应用)', '数据清洗'),
  stringsAsFactors = F
)
fig_halfcircles_emph(rawdata, title = '数据分析各环节耗时', subtitle = 'hours',
                     caption = '注：数据纯属虚构')

