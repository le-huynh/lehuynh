# Import Excel file with multiple sheets

This function imports an Excel file with multiple sheets and returns a
*named* `list` of imported sheets.

## Usage

``` r
import_excel(file_path)
```

## Arguments

- file_path:

  A character string specifying the path to the Excel file.

## Value

A named list where each element is the imported sheet from the Excel
file, with names corresponding to the sheet names.

## Examples

``` r
## For demo, a temp. file path is created with the file extension .xlsx
excel_file <- tempfile(fileext = ".xlsx")

## create Excel file with multiple sheets to import
writexl::write_xlsx(list(cars = head(cars), mtcars = head(mtcars)),
                    excel_file)

import_excel(file_path = excel_file)
#> $cars
#> # A tibble: 6 × 2
#>   speed  dist
#>   <dbl> <dbl>
#> 1     4     2
#> 2     4    10
#> 3     7     4
#> 4     7    22
#> 5     8    16
#> 6     9    10
#> 
#> $mtcars
#> # A tibble: 6 × 11
#>     mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1  21       6   160   110  3.9   2.62  16.5     0     1     4     4
#> 2  21       6   160   110  3.9   2.88  17.0     0     1     4     4
#> 3  22.8     4   108    93  3.85  2.32  18.6     1     1     4     1
#> 4  21.4     6   258   110  3.08  3.22  19.4     1     0     3     1
#> 5  18.7     8   360   175  3.15  3.44  17.0     0     0     3     2
#> 6  18.1     6   225   105  2.76  3.46  20.2     1     0     3     1
#> 
```
