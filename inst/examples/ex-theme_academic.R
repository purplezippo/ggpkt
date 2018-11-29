data(medical_cpi)
head(medical_cpi)

medical_cpi$time <- as.Date(paste0(medical_cpi$time, '01'), format = '%Y%m%d')

windowsFonts(yahei = windowsFont("微软雅黑"))
p <- ggplot(medical_cpi) +
  geom_line(aes(x = time, y = cpi, col = medi_type), size = 1)

# academic light
p + theme_yk_academic_light(base_family = 'yahei') +
  scale_color_academic_light()

# academic dark
p + theme_yk_academic_dark(base_family = 'yahei') +
  scale_color_academic_dark()
