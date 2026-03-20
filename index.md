# lehuynh

[Le-Huynh Truc-Ly’s](https://lehuynh.rbind.io/) R Code and Templates

`lehuynh` is an R package comprising a collection of miscellaneous R
functions and templates that I find particularly useful.

This package includes:  
- Functions for graphics, data importation, data transformation, and
general utilities.  
- Templates for Exploratory Analysis, Bayesian modeling, and crafting
scientific manuscripts.

## Installation

`lehuynh` R package is available on CRAN via:

``` r
install.packages("lehuynh")
```

To get the latest in-development features, install the development
version from GitHub:

``` r
if(!requireNamespace("devtools", quietly = TRUE)) {
 install.packages("devtools")
}
devtools::install_github("le-huynh/lehuynh")
```

This package is also accessible for download via Zenodo with the DOI
[10.5281/zenodo.11522849](https://doi.org/10.5281/zenodo.11522849).

### Functions

- [`cal_tn()`](https://le-huynh.github.io/lehuynh/reference/cal_tn.md):
  Calculate Total Nitrogen (TN) concentration for samples using
  spectrophotometric data
- [`ggsave_elsevier( )`](https://le-huynh.github.io/lehuynh/reference/ggsave_elsevier.md):
  Save a plot using
  [`ggplot2::ggsave( )`](https://ggplot2.tidyverse.org/reference/ggsave.html).
  Plot size follows instructions of Elsevier journals.
- [`import_data( )`](https://le-huynh.github.io/lehuynh/reference/import_data.md):
  Imports multiple data files of the same format from a specified
  directory. The output is a named list of imported objects.
- [`import_excel( )`](https://le-huynh.github.io/lehuynh/reference/import_excel.md):
  Imports an Excel file with multiple sheets and returns a named list of
  imported sheets.
- [`lehuynh_theme( )`](https://le-huynh.github.io/lehuynh/reference/lehuynh_theme.md):
  Personal ggplot2 theme (white background, black axis, black text,
  etc.).
- [`MinMaxScaling( )`](https://le-huynh.github.io/lehuynh/reference/MinMaxScaling.md):
  Min-max normalization (min = 0, max = 1).
- [`new_project( )`](https://le-huynh.github.io/lehuynh/reference/new_project.md):
  Create a [project](https://github.com/SchlossLab/new_project) for
  reproducible purpose.
- [`ngrams_filter()`](https://le-huynh.github.io/lehuynh/reference/ngrams_filter.md):
  Filter and generate N-Grams from text data.
- [`plot_networkD3()`](https://le-huynh.github.io/lehuynh/reference/plot_networkD3.md):
  Plot network using NetworkD3.
- [`ppc_brms( )`](https://le-huynh.github.io/lehuynh/reference/ppc_brms.md):
  Plot fitted versus observed values for *brmsfit* Objects.
- [`tidytuesday( )`](https://le-huynh.github.io/lehuynh/reference/tidytuesday.md):
  Create a new folder for
  [\#tidytuesday](https://github.com/rfordatascience/tidytuesday)
  challenge.
- [`tsi( )`](https://le-huynh.github.io/lehuynh/reference/tsi.md):
  Calculate TSI (Trophic state index) (Carlson, 1977).

### Templates

- `draft_elsevier`: Creating an Rmarkdown manuscript for Elsevier
  journals
  [(example)](https://github.com/le-huynh/writing_journal_article_in_rmarkdown/tree/master/elsevier).
- `lehuynh_Bayes_brms`: Basic steps to fit, check, and interpret a
  Bayesian model via `brms` package.
- `lehuynh_EA`: Basic steps to do Exploratory Analysis.
