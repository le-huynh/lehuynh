# Create a new folder for *\#tidytuesday* challenge

This function sets up a new folder for
*[\#tidytuesday](https://github.com/rfordatascience/tidytuesday)*
challenge within an **active project**. It creates a directory for the
specified year and week, along with sub-directories for data, code, and
plots. Template files are also added.

## Usage

``` r
tidytuesday(year, week)
```

## Arguments

- year:

  An integer representing the year of the *\#tidytuesday* challenge

- week:

  An integer representing the week of interest, from 1 to 52

## Value

A folder containing folders and files for *\#tidytuesday* challenge.

## Details

The folder includes:

- **README.md**: plots for *\#tidytuesday* challenge

- different folders to hold all *data*, *code*, *plots* of data analysis

- templates

## Note

Ensure that this function is called within an **active project**.

## Examples

``` r
if(interactive()){
  tidytuesday(year = 2021, week = 25)
}
```
