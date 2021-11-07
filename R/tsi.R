#' Calculate TSI (Trophic state index)
#'
#' Calculate TSI.
#' TSI range: 0 - 100.
#'
#' @param x numeric object
#' @param type type of variable used to calculate TSI.
#'             See __Details__ for more information.
#'
#' @return
#' @export
#'
#' @details
#' Trophic state classification (Carlson, 1996)
#' * <30-40, Oligotrophy
#' * 40-50, mesotrophy
#' * 50-70, eutrophy
#' * 70-100, hypereutrophy
#'
#' Type of variable used to calculate TSI:
#' * SD: Secchi depth, meter
#' * chla: chlorophyll, ug/L or mg/m3
#' * TP: total Phosphorus, ug/L or mg/m3
#' * TN: total Nitrogen, mg/L
#'
#' Carlson (1977): TSI-SD, TSI-Chla, TSI-TP
#'
#' USEPA (2000): TSI-TN
#'
#' @references
#' Carlson, R. E. (1977). A trophic state index for lakes. Limnology and
#' Oceanography, 22(2), 361-369.
#'
#' Carlson, R. E., & Simpson, J. (1996). A Coordinator's Guide to Volunteer
#' Lake Monitoring Methods. North American Lake Management Society, 73-92.
#'
#' USEPA. (2000). Nutrient Criteria Technical Guidance Manual: Lakes and
#' Reservoirs, 42-44.
#'
#' @examples
#' chla <- c(0.12, 0.34, 0.94, 6.4)
#'
#' tsi(chla, type = "chla")


tsi <- function(x,
                type = c("chla", "TP", "TN", "SD")
                ) {

          type <- match.arg(type)

          switch(type,
                 chla = 10 * (6 - ((2.04 - 0.68 * log(x)) / log(2))),
                 TP = 10 * (6 - (log(48/x)/log(2))),
                 TN = 54.45 + 14.43 * log(x),
                 SD = 10 * (6 - (log(x)/log(2)))
                 )
}
