# Create a new project

This function sets up a new project within an **active R project** for
reproducible purposes.

## Usage

``` r
new_project()
```

## Value

A project containing folders and files for reproducible purposes.

## Details

The project includes:

- **README.md**: the top level description of content in the project

- **Makefile**

- different folders to hold all *data*, *code*, *results* of data
  analysis, and *documents* related to the project

- templates: **manuscript.Rmd**, **code.R**, etc.

## Note

The function should be executed within an **active project**.

Recommended workflow:

1.  Create a GitHub repository for the new project. At *Initialize this
    repository with a README*, choose NO.

2.  Create a new RStudio Project via `git clone`.

3.  Use function `new_project()` to generate folders and file templates.

## References

[Reproducibile Research Tutorial
Series](https://riffomonas.org/reproducible_research/) by Pat Schloss.

## Examples

``` r
if(interactive()){
  new_project()
}
```
