
#' Create a new folder for _#tidytuesday_ challenge
#'
#' _[#tidytuesday](https://github.com/rfordatascience/tidytuesday)_ challenge
#'
#' @param year numeric entry for year
#' @param week the week of interest
#'
#' @return A folder containing folders and files for _#tidytuesday_ challenge.
#' @export
#'
#' @details
#' The folder includes:
#' * __README.md__: plots for _#tidytuesday_ challenge
#' * different folders to hold all _data_, _code_, _plots_ of data analysis
#' * templates
#'
tidytuesday = function(year, week)
{
          here::here()

          dir_name <- paste0(year, "/", year, "_week_", week, "/")

          dir_sub <- c("data", "code", "plots")
          dir_sub <- paste0(dir_name, dir_sub)

          dir.create(dir_name)
          sapply(dir_sub, dir.create)

          usethis::use_template(template = "tidytuesday/README.md",
                                save_as = paste0(dir_name, "README.md"),
                                package = "lehuynh")

          usethis::use_template(template = "tidytuesday/data_description.md",
                                save_as = paste0(dir_name, "data/README.md"),
                                package = "lehuynh")

          usethis::use_template(template = "tidytuesday/get_data.R",
                                save_as = paste0(dir_name, "code/get_data.R"),
                                package = "lehuynh")

          usethis::use_template(template = "tidytuesday/tidy_tuesday.Rmd",
                                save_as = paste0(dir_name, "dataset.Rmd"),
                                package = "lehuynh")
}
