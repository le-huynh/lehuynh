## code to prepare `TN_raw_data` dataset

f <- system.file("extdata",
                 "TN_raw_data.csv",
                 package = "lehuynh")

TN_raw_data <- rio::import(f)

usethis::use_data(TN_raw_data, overwrite = TRUE)
