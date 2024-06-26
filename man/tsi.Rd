% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tsi.R
\name{tsi}
\alias{tsi}
\title{Calculate TSI (Trophic state index)}
\usage{
tsi(x, type = c("chla", "TP", "TN", "SD"))
}
\arguments{
\item{x}{numeric object}

\item{type}{type of variable used to calculate TSI.
See \strong{Details} for more information.}
}
\value{
a numeric value.
}
\description{
Calculate TSI.
TSI range: 0 - 100.
}
\details{
Trophic state classification (Carlson, 1996)
\itemize{
\item <30-40, Oligotrophy
\item 40-50, mesotrophy
\item 50-70, eutrophy
\item 70-100, hypereutrophy
}

Type of variable used to calculate TSI:
\itemize{
\item SD: Secchi depth, meter
\item chla: chlorophyll, ug/L or mg/m3
\item TP: total Phosphorus, ug/L or mg/m3
\item TN: total Nitrogen, mg/L
}

Carlson (1977): TSI-SD, TSI-Chla, TSI-TP

USEPA (2000): TSI-TN
}
\examples{
chla <- c(0.12, 0.34, 0.94, 6.4)

tsi(chla, type = "chla")

tsi(chla, type = "TP")
}
\references{
Carlson, R. E. (1977). A trophic state index for lakes. Limnology and
Oceanography, 22(2), 361-369.

Carlson, R. E., & Simpson, J. (1996). A Coordinator's Guide to Volunteer
Lake Monitoring Methods. North American Lake Management Society, 73-92.

USEPA. (2000). Nutrient Criteria Technical Guidance Manual: Lakes and
Reservoirs, 42-44.
}
