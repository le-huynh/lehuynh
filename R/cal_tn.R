#' Calculate Total Nitrogen (TN) Concentration
#'
#' This function calculates Total Nitrogen (TN) concentration for samples using
#' spectrophotometric data. It fits a linear model for each sample based on
#' blank measurements and an undigested nitrate standard, then derives
#' concentration estimates from model coefficients.
#'
#' @param data A data frame or tibble containing spectral measurements.
#'   Must include a column `No.` identifying samples, and multiple columns
#'   representing absorbance values at different wavelengths.
#' @param blank_name A character vector specifying the sample IDs in `No.`
#'   that correspond to blank measurements.
#' @param undigested_std A character string specifying the sample ID in `No.`
#'   corresponding to the undigested nitrate standard. Default is `"NO3ud"`.
#' @param dilution_rate A numeric value used to scale the measured concentration
#' determined based on ratio between sample volume and digestion solution volume
#' to obtain actual concentration. Default is `1.5`.
#'
#' @returns
#' A tibble containing:
#' \itemize{
#'   \item Sample identifier (`No.`)
#'   \item Model coefficients (`(Intercept)`, `NO3ud`, `blank`)
#'   \item Calculated TN concentration
#' }
#' @export
#'
#' @examples
#' # example dataset
#' lehuynh::TN_raw_data
#'
#' cal_tn(data = TN_raw_data,
#'        blank_name = c("B1", "B2", "B3", "B4", "B5"),
#'        undigested_std = "NO3ud",
#'        dilution_rate = 1.5)

cal_tn <- function(data,
                   blank_name,
                   undigested_std = "NO3ud",
                   dilution_rate = 1.5){

          df_blank <- data %>%
                    dplyr::filter(No. %in% blank_name) %>%
                    tidyr::pivot_longer(cols = !No.,
                                        names_to = "wavelength",
                                        values_to = "value") %>%
                    dplyr::group_by(wavelength) %>%
                    dplyr::summarise(blank = mean(value))

          df_no3ud <- data %>%
                              dplyr::filter(No. == undigested_std) %>%
                              tidyr::pivot_longer(cols = !No.,
                                                  names_to = "wavelength",
                                                  values_to = undigested_std) %>%
                              dplyr::select(-No.)

          df_final <- data %>%
                    tidyr::pivot_longer(cols = !No.,
                                        names_to = "wavelength",
                                        values_to = "sample") %>%
                    tidyr::nest(.by = No.) %>%
                    dplyr::mutate(model = purrr::map(data,
                                                     \(data) {
                                                  df <- dplyr::left_join(data, df_blank,
                                                                         by = dplyr::join_by(wavelength)) %>%
                                                            dplyr::left_join(df_no3ud,
                                                                             by = dplyr::join_by(wavelength))

                                                  res <- lm(sample ~ NO3ud + blank, data = df)

                                                  return(res)
                                        }),
                                  coef = purrr::map_df(model,
                                                     \(model) stats::coef(model))) %>%
                    dplyr::select(No., coef) %>%
                    tidyr::unnest(coef) %>%
                    dplyr::mutate(concentration = NO3ud * dilution_rate)

          return(df_final)
}

