#---
# get_data.R
#
# This Rscript:
# * loads the datasets for the week of interest
# * save the datasets in .cvs file
# * create a tidytuesday template (.Rmd) for data analysis
# Note: something here
#
# Dependencies...
#
# Produces...
# data/data_name.csv
#---

# install.packages("tidytuesdayR")
library(tidytuesdayR)
library(tidyverse)

# load and save the data
year <- YY
week <- WW
dir_name <- paste0(year, "/", year, "_week_", week, "/")
file_name <- "str"

tt_output <- tt_load_gh(year, week)

tt_data <- tt_download(tt_output, files = paste0(file_name, ".csv"))
write.csv(tt_data[[1]],
          file = paste0(dir_name, "data/", file_name, ".csv"),
          row.names = FALSE)

# Use the tidytemplate Rmd
use_tidytemplate(name = paste0(dir_name, file_name, ".Rmd"))

