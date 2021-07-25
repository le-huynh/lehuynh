

#' Min-Max Standardization
#'
#' Normalize / Standardize / Scale the data to the fixed range from 0 to 1.
#' The minimum value of data gets transformed into 0.
#' The maximum value gets transformed into 1.
#' Other values get transformed into decimals between 0 and 1.
#'
#'
#' @param x numeric object
#' @param y numeric object, default: y = x
#'
#' @return numeric object
#' @export
#'
#' @examples
#' dat1 = seq(from = 5, to = 30, length.out = 6)
#'
#' MinMaxScaling(dat1)
#'
#' dat2 = c(7, 13, 22)
#' MinMaxScaling(x = dat2, y = dat1)


MinMaxScaling = function(x, y = x)
          {
          minx = min(y, na.rm = TRUE)
          maxx = max(y, na.rm = TRUE)
          (x - minx) / (maxx - minx)
          }
