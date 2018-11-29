data(medical_cpi)
head(medical_cpi)

medical_cpi$time <- as.Date(paste0(medical_cpi$time, '01'), format = '%Y%m%d')

windowsFonts(yahei = windowsFont("微软雅黑"))
p <- ggplot(medical_cpi) +
  geom_line(aes(x = time, y = cpi, col = medi_type), size = 1)

# light
p + theme_yk_business_light(base_family = 'yahei') +
  scale_color_business_light()

# dark
p + theme_yk_business_dark(base_family = 'yahei') +
  scale_color_business_dark()

# continuous scale
p2 <- ggplot(medical_cpi) +
  geom_point(aes(x = time, y = cpi, colour = cpi, fill = cpi), size = 5, shape = 21)

p2 + theme_yk_business_light(base_family = 'yahei') +
  scale_colour_business_continuous(col.scheme = 'blue') +
  scale_fill_business_continuous(col.scheme = 'red')
