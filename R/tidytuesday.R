#' Create a new folder for _#tidytuesday_ challenge
#'
#' This function sets up a new folder for
#' _[#tidytuesday](https://github.com/rfordatascience/tidytuesday)_ challenge
#' within an **active project**.
#' It creates a directory for the specified year and week,
#' along with sub-directories for data, code, and plots.
#' Template files are also added.
#'
#' @param year An integer representing the year of the _#tidytuesday_ challenge
#' @param week An integer representing the week of interest, from 1 to 52
#'
#' @return A folder containing folders and files for _#tidytuesday_ challenge.
#'
#' @export
#'
#' @details
#' The folder includes:
#' * __README.md__: plots for _#tidytuesday_ challenge
#' * different folders to hold all _data_, _code_, _plots_ of data analysis
#' * templates
#'
#' @note Ensure that this function is called within an **active project**.
#'
#' @examples
#' \donttest{
#'
#' if(interactive()){
#'   tidytuesday(year = 2021, week = 25)
#' }
#' }


tidytuesday <- function(year, week){

          usethis::proj_get()

          is.wholenumber <- function(x, tol = .Machine$double.eps^0.5){
                    abs(x - round(x)) < tol
          }

          stopifnot(is.wholenumber(year), is.wholenumber(week))
          stopifnot(year >= 0, week >= 1, week <=52)

          if(!fs::dir_exists(file.path(year))) {
                    fs::dir_create(file.path(year))
          }

          dir_name <- file.path(year, paste0(year, "_week_", week))

          dir_sub <- file.path(dir_name, c("data", "code", "plots"))

          fs::dir_create(dir_name)
          sapply(dir_sub, fs::dir_create)

          usethis::use_template(template = "tidytuesday/README.md",
                                save_as = file.path(dir_name, "README.md"),
                                package = "lehuynh")

          usethis::use_template(template = "tidytuesday/data_description.md",
                                save_as = file.path(dir_name, "data/README.md"),
                                package = "lehuynh")

          usethis::use_template(template = "tidytuesday/get_data.R",
                                save_as = file.path(dir_name, "code/get_data.R"),
                                package = "lehuynh")

          usethis::use_template(template = "tidytuesday/tidy_tuesday.Rmd",
                                save_as = file.path(dir_name, "dataset.Rmd"),
                                package = "lehuynh")
}
