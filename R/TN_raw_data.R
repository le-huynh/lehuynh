#' Raw data for Total Nitrogen calculation
#'
#' An example dataset containing spectrophotometric measurements across
#' multiple wavelengths.
#'
#' @format ## `TN_raw_data`
#' A dataframe with 15 rows and 6 columns:
#' \describe{
#'   \item{No.}{Character. Sample identifier. Includes:
#'     \itemize{
#'       \item `"NO3ud"`: undigested nitrate standard
#'       \item `"B1"`–`"B5"`: blank samples
#'       \item `"STD1"`–`"STD3"`: standard samples
#'       \item `"sample1"`–`"sample6"`: unknown samples
#'     }}
#'   \item{wl200}{Numeric. Absorbance at 200 nm}
#'   \item{wl210}{Numeric. Absorbance at 210 nm}
#'   \item{wl220}{Numeric. Absorbance at 220 nm}
#'   \item{wl230}{Numeric. Absorbance at 230 nm}
#'   \item{wl250}{Numeric. Absorbance at 250 nm}
#' }

"TN_raw_data"
