medical_cpi <- read.csv('data-raw/medical_cpi.csv', header = TRUE,
                        stringsAsFactors = FALSE)

# save data to .rda file
usethis::use_data(medical_cpi, overwrite = TRUE)
