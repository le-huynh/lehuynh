
#' Create a new folder for _#tidytuesday_ challenge
#'
#' _[#tidytuesday](https://github.com/rfordatascience/tidytuesday)_ challenge
#'
#' @param year numeric entry for year
#' @param week numeric entry for the week of interest, from 1 to 52
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
#' @examples
#' \dontrun{
#' tidytuesday(2023, 42)
#'}


tidytuesday = function(year, week){

          is.wholenumber <- function(x, tol = .Machine$double.eps^0.5){
                    abs(x - round(x)) < tol
          }

          stopifnot(is.wholenumber(year), is.wholenumber(week))
          stopifnot(year >= 0, week >= 1, week <=52)

          if(!dir.exists(paste0(here::here(), "/", year))) {
                    dir.create(paste0(here::here(), "/", year))
          }

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
