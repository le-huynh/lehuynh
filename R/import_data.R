#' Import multiple files of the same format
#'
#' This function imports multiple data files of the same format from
#' a specified directory, optionally filtered by a pattern in the filenames.
#'
#' @param path A character string specifying the directory path
#'        where the data files are located.
#' @param file_format A character string specifying the type of files to import,
#'        using a glob pattern (e.g., "*.csv" for CSV files).
#' @param pattern An optional character string specifying a regex pattern
#'        to filter filenames. Default is NULL.
#' @param ... Additional arguments passed to the [rio::import()] function.
#'
#' @return A named list where each element is the imported data from a file,
#'        with names corresponding to the filenames without the path and file extension.
#'
#' @export
#'
#' @examples
#'
#' ## For demo, temp. file paths is created with the file extension .csv
#' csv_file1 <- tempfile(pattern = "test", fileext = ".csv")
#' csv_file2 <- tempfile(pattern = "file", fileext = ".csv")
#' csv_file3 <- tempfile(pattern = "test", fileext = ".csv")
#'
#' ## create CSV files to import
#' write.csv(head(cars), csv_file1)
#' write.csv(head(mtcars), csv_file2)
#' write.csv(head(iris), csv_file3)
#'
#' ## Import all CSV files in the directory
#' data_list <- import_data(path = tempdir(), file_format = "*.csv")
#'
#' ## Import all CSV files with names containing "test"
#' data_list <- import_data(path = tempdir(), file_format = "*.csv", pattern = "test")


import_data <- function(path,
                        file_format,
                        pattern = NULL,
                        ...){

          if (is.null(pattern)) {
                file_list <- fs::dir_ls(path = path,
                                        glob = file_format)
          } else {
                file_list <- fs::dir_ls(path = path,
                                        glob = file_format) %>%
                      tibble::as_tibble() %>%
                      dplyr::filter(stringr::str_detect(value, pattern)) %>%
                      dplyr::pull()
          }

          file_extension <- stringr::str_remove(file_format, "\\*")
          file_name <- file_list %>%
                    stringr::str_remove(fs::path_expand(path)) %>%
                    stringr::str_remove("/") %>%
                    stringr::str_remove(file_extension)

          output_list <- purrr::map(file_list, rio::import, ...) %>%
                    purrr::set_names(file_name)

          return(output_list)
}

