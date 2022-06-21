
#' Import .csv or .rds objects
#'
#' This function imports multiple \code{.csv} or \code{.rds} objects
#' from a given folder.
#'
#' @param file_path a character vector of full path names.
#' @param data_type type of imported objects, \code{csv} or \code{rds}.
#' @param output    type of output, \code{list} or \code{object}.
#' @param input_pattern an optional regular expression. Only file names
#'                      which match the regular expression will be returned.
#' @param remove_pattern an optional regular expression.
#'                       Remove the matching regular expression in file names.
#'
#' @return
#' * \code{output = "list"}, a _named_ \code{list} of imported objects
#' * \code{output = "object"}, multiple objects in the .GlobalEnv
#'
#' @export
#'
#' @examples
#' \dontrun{
#' path <- here::here("data/raw")
#'
#' mydata <- import_data(file_path = path,
#'                       data_type = "csv",
#'                       output = "list",
#'                       input_pattern = "pc_gene",
#'                       remove_pattern = "gene")
#'
#' import_data(file_path = path,
#'             data_type = "csv",
#'             output = "object",
#'             input_pattern = "pc_gene",
#'             remove_pattern = "gene")
#'}


import_data <- function(file_path,
                        data_type = c("csv", "rds"),
                        output = c("list", "object"),
                        input_pattern = NULL,
                        remove_pattern = "NULL"
)
{

          data_type = match.arg(data_type)
          output = match.arg(output)

          if (data_type == "csv") {
                    if (is.null(input_pattern)) pattern <- "\\.csv$"
                    else pattern <- input_pattern
                    loading_function = readr::read_csv
          }

          if (data_type == "rds") {
                    if (is.null(input_pattern)) pattern <- "\\.rds$"
                    else pattern <- input_pattern
                    loading_function = readr::read_rds
          }

          file_list = list.files(path = file_path,
                                 recursive = TRUE,
                                 pattern = pattern,
                                 full.names = TRUE)

          file_name = file_list %>%
                    stringr::str_remove(file_path) %>%
                    stringr::str_remove("/") %>%
                    stringr::str_remove(remove_pattern)

          if (output == "list") {
                    output_list <- purrr::map(file_list, loading_function) %>%
                              purrr::set_names(file_name)
                    return(output_list)
          }

          if (output == "object") {
                    purrr::map(file_list, loading_function) %>%
                              purrr::set_names(file_name) %>%
                              list2env(envir = .GlobalEnv)
          }
}


