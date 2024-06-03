#' Min-Max Standardization
#'
#' Normalize / Standardize / Scale the data to the fixed range from 0 to 1.
#' The minimum value of data gets transformed into 0.
#' The maximum value gets transformed into 1.
#' Other values get transformed into decimals between 0 and 1.
#'
#'
#' @param x A numeric vector to be scaled.
#' @param y An optional numeric vector used to determine the scaling range.
#'        If not provided, the scaling range is determined by the values in `x`.
#'        Default: `y` = `x`.
#'
#' @return A numeric vector of the same length as `x`,
#'        with values scaled to the range from 0 to 1.
#'
#' @details Min-max scaling is a normalization technique that transforms
#'        the values in a vector to a standardized range.
#'        The scaling is performed using the formula:
#'        \deqn{scaled_x = \frac{x - \min(y)}{\max(y) - \min(y)}}
#'
#' @export
#'
#' @examples
#'
#' dat1 = seq(from = 5, to = 30, length.out = 6)
#'
#' MinMaxScaling(dat1)
#'
#' dat2 = c(7, 13, 22)
#'
#' MinMaxScaling(x = dat2, y = dat1)


MinMaxScaling <- function(x, y = x){

          minx <- min(y, na.rm = TRUE)
          maxx <- max(y, na.rm = TRUE)

          output <- (x - minx) / (maxx - minx)

          return(output)
}

