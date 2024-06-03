#' Import Excel file with multiple sheets
#'
#' This function imports an Excel file with multiple sheets and returns
#' a _named_ \code{list} of imported sheets.
#'
#' @param file_path A character string specifying the path to the Excel file.
#'
#' @return A named list where each element is the imported sheet from the Excel file,
#'        with names corresponding to the sheet names.
#'
#' @export
#'
#' @examples
#' ## For demo, a temp. file path is created with the file extension .xlsx
#' excel_file <- tempfile(fileext = ".xlsx")
#'
#' ## create Excel file with multiple sheets to import
#' writexl::write_xlsx(list(cars = head(cars), mtcars = head(mtcars)),
#'                     excel_file)
#'
#' import_excel(file_path = excel_file)


import_excel <- function(file_path){

          sheet_name <- readxl::excel_sheets(file_path)

          output_list <- purrr::map(.x = sheet_name,
                                   ~ readxl::read_excel(path = file_path,
                                                        sheet = .x)) %>%
                    purrr::set_names(sheet_name)

          return(output_list)
}



