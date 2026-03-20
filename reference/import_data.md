# Import multiple files of the same format

This function imports multiple data files of the same format from a
specified directory, optionally filtered by a pattern in the filenames.

## Usage

``` r
import_data(path, file_format, pattern = NULL, ...)
```

## Arguments

- path:

  A character string specifying the directory path where the data files
  are located.

- file_format:

  A character string specifying the type of files to import, using a
  glob pattern (e.g., "\*.csv" for CSV files).

- pattern:

  An optional character string specifying a regex pattern to filter
  filenames. Default is NULL.

- ...:

  Additional arguments passed to the
  [`rio::import()`](http://gesistsa.github.io/rio/reference/import.md)
  function.

## Value

A named list where each element is the imported data from a file, with
names corresponding to the filenames without the path and file
extension.

## Examples

``` r
## For demo, temp. file paths is created with the file extension .csv
csv_file1 <- tempfile(pattern = "test", fileext = ".csv")
csv_file2 <- tempfile(pattern = "file", fileext = ".csv")
csv_file3 <- tempfile(pattern = "test", fileext = ".csv")

## create CSV files to import
write.csv(head(cars), csv_file1)
write.csv(head(mtcars), csv_file2)
write.csv(head(iris), csv_file3)

## Import all CSV files in the directory
data_list <- import_data(path = tempdir(), file_format = "*.csv")

## Import all CSV files with names containing "test"
data_list <- import_data(path = tempdir(), file_format = "*.csv", pattern = "test")
```
