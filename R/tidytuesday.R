
#' Create a new folder for _#tidytuesday_ challenge
#'
#' _[#tidytuesday](https://github.com/rfordatascience/tidytuesday)_ challenge
#'
#' @param dir_name name of the folder, a character string
#'
#' @return
#' @export
#'
#' @details
#' The folder includes:
#' * __README.md__: plots for _#tidytuesday_ challenge
#' * different folders to hold all _data_, _code_, _plots_ of data analysis
#' * templates: __code.R__
#'
tidytuesday = function(dir_name)
{
          here::here()

          dir_sub <- c("data", "code", "plots")
          dir_sub <- paste0(dir_name, "/", dir_sub)

          dir.create(dir_name)
          sapply(dir_sub, dir.create)

          usethis::use_template(template = "README_tidytuesday.md",
                                save_as = paste0(dir_name, "/README.md"),
                                package = "lehuynh")
}
