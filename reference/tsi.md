# Calculate TSI (Trophic state index)

Calculate TSI. TSI range: 0 - 100.

## Usage

``` r
tsi(x, type = c("chla", "TP", "TN", "SD"))
```

## Arguments

- x:

  numeric object

- type:

  type of variable used to calculate TSI. See **Details** for more
  information.

## Value

a numeric value.

## Details

Trophic state classification (Carlson, 1996)

- \<30-40, Oligotrophy

- 40-50, mesotrophy

- 50-70, eutrophy

- 70-100, hypereutrophy

Type of variable used to calculate TSI:

- SD: Secchi depth, meter

- chla: chlorophyll, ug/L or mg/m3

- TP: total Phosphorus, ug/L or mg/m3

- TN: total Nitrogen, mg/L

Carlson (1977): TSI-SD, TSI-Chla, TSI-TP

USEPA (2000): TSI-TN

## References

Carlson, R. E. (1977). A trophic state index for lakes. Limnology and
Oceanography, 22(2), 361-369.

Carlson, R. E., & Simpson, J. (1996). A Coordinator's Guide to Volunteer
Lake Monitoring Methods. North American Lake Management Society, 73-92.

USEPA. (2000). Nutrient Criteria Technical Guidance Manual: Lakes and
Reservoirs, 42-44.

## Examples

``` r
chla <- c(0.12, 0.34, 0.94, 6.4)

tsi(chla, type = "chla")
#> [1]  9.768544 19.985546 29.962003 48.779910

tsi(chla, type = "TP")
#> [1] -26.438562 -11.413558   3.257702  30.931094
```
