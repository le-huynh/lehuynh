#' Create a new project
#'
#' Create a project for reproducible purposes.
#'
#' @return A project containing folders and files for reproducible purposes.
#' @export
#'
#' @details
#' The project includes:
#' * __README.md__: the top level description of content in the project
#' * __Makefile__
#' * different folders to hold all _data_, _code_, _results_ of data analysis,
#' and _documents_ related to the project
#' * templates: __manuscript.Rmd__, __code.R__, etc.
#'
#' @note
#' Recommended workflow:
#' 1. Create a GitHub repository for the new project.
#' At _Initialize this repository with a README_, choose NO.
#' 1. Create a new RStudio Project via git clone.
#' 1. Use function `new_project()` to generate folders and file templates.
#'
#' @references
#' [Reproducibile Research Tutorial Series](https://riffomonas.org/reproducible_research/)
#' by Pat Schloss.
#'
#' @examplesIf FALSE
#' new_project()


new_project = function()
{
          here::here()

          dir_main <- c("data",
                        "code",
                        "results",
                        "exploratory",
                        "submission")

          dir_sub <- c("data/raw",
                       "data/process",
                       "results/figures",
                       "results/tables",
                       "results/pictures",
                       "exploratory/notebook",
                       "exploratory/text",
                       "exploratory/scratch")

          sapply(dir_main, dir.create)
          sapply(dir_sub, dir.create)

          usethis::use_template(template = "new_project/README.md",
                                save_as = "README.md",
                                package = "lehuynh")

          usethis::use_template(template = "new_project/Makefile",
                                save_as = "Makefile",
                                package = "lehuynh")

          usethis::use_template(template = "new_project/data_description.md",
                                save_as = "data/process/README.md",
                                package = "lehuynh")

          usethis::use_template(template = "new_project/code.R",
                                save_as = "code/code.R",
                                package = "lehuynh")

          usethis::use_template(template = "new_project/manuscript.Rmd",
                                save_as = "submission/manuscript.Rmd",
                                package = "lehuynh")
}
