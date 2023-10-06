
#' Import excel file with multiple sheets
#'
#' This function imports an excel file with multiple sheets and returns
#' a _named_ \code{list} of imported sheets or multiple data frames in the
#' .GlobalEnv. The data frames are named after the sheet names.
#'
#' @param file_path path to the xls/xlsx file.
#' @param output type of output, \code{list} or \code{data-frame}.
#'
#' @return
#' * \code{output = "list"}, a _named_ \code{list} of imported sheets
#' * \code{output = "dataframe"}, multiple data frames in the .GlobalEnv

#' @export
#'
#' @examples
#' \dontrun{
#' path <- here::here("data/data.xlsx")
#'
#' mydata <- import_excel(file_path = path,
#'                       output = "list")
#'
#' import_excel(file_path = path,
#'              output = "dataframe")
#'}


import_excel <- function(file_path,
                         output = c("list", "dataframe")){

          output = match.arg(output)

          sheet_name = readxl::excel_sheets(file_path)

          output_list = purrr::map(.x = sheet_name,
                                   ~ readxl:read_excel(path = file_path,
                                                       sheet = .x)) %>%
                    readxl::set_names(sheet_name)

          if (output == "list") return(output_list)

          if (output == "dataframe"){
                    output_df = output_list %>%
                              list2env(envir = .GlobalEnv)

                    return(output_df)
          }
}



