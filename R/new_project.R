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

          usethis::use_template(template = "README.md",
                                save_as = "data/README.md",
                                package = "lehuynh")

          usethis::use_template(template = "Makefile",
                                save_as = "data/Makefile",
                                package = "lehuynh")

          usethis::use_template(template = "data_description.md",
                                save_as = "data/process/README.md",
                                package = "lehuynh")

          usethis::use_template(template = "code.R",
                                save_as = "code/code.R",
                                package = "lehuynh")

          usethis::use_template(template = "manuscript.Rmd",
                                save_as = "submission/manuscript.Rmd",
                                package = "lehuynh")

}
