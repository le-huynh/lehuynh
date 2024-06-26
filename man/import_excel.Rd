% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/import_excel.R
\name{import_excel}
\alias{import_excel}
\title{Import Excel file with multiple sheets}
\usage{
import_excel(file_path)
}
\arguments{
\item{file_path}{A character string specifying the path to the Excel file.}
}
\value{
A named list where each element is the imported sheet from the Excel file,
with names corresponding to the sheet names.
}
\description{
This function imports an Excel file with multiple sheets and returns
a \emph{named} \code{list} of imported sheets.
}
\examples{
## For demo, a temp. file path is created with the file extension .xlsx
excel_file <- tempfile(fileext = ".xlsx")

## create Excel file with multiple sheets to import
writexl::write_xlsx(list(cars = head(cars), mtcars = head(mtcars)),
                    excel_file)

import_excel(file_path = excel_file)
}
