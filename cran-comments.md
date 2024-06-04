## Resubmission

This is a re-submission. In this version:

* Examples wrapped in if(FALSE) have been removed.

* Toy examples that can be regularly executed and checked have been added in the following files:
  - R/ggsave_elsevier.R
  - R/import_data.R
  - R/import_excel.R
  - R/lehuynh_theme.R
  
* Examples have been wrapped in \donttest{} in the following files:
  - R/new_project.R
  - R/tidytuesday.R
  
* In R/ppc_brms.R, examples have been wrapped in \dontrun{} because of an issue with Boost not being found when compiling the Stan program during R CMD check of GitHub Actions.

* Re-wrote the functions and removed the code that modify the .GlobalEnv in:
  - R/import_data.R
  - R/import_excel.R

* Removed default path in writing functions:
  - R/ggsave_elsevier.R
  - R/new_project.R
  - R/tidytuesday.R

## R CMD check results

0 errors | 0 warnings | 0 notes

