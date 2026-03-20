# Fitted versus observed plot for brmsfit Objects

Plot fitted versus observed values, including confidence interval (gray
area) around best fit line (linear regression line) and prediction
interval (dashed line).

## Usage

``` r
ppc_brms(
  object,
  xtitle = "Observed value",
  ytitle = "Fitted value",
  dy = c(0.1, 0.1),
  dx = c(0.1, 0.1),
  cor = FALSE,
  equation = FALSE,
  xcor = NULL,
  ycor = NULL,
  xequ = NULL,
  yequ = NULL,
  ...
)
```

## Arguments

- object:

  An object of class **brmsfit**

- xtitle:

  The text for the x-axis title

- ytitle:

  The text for the y-axis title

- dy:

  Distance from plot to y-axis

- dx:

  Distance from plot to x-axis

- cor:

  If TRUE, add correlation coefficients with p-values and R

- equation:

  If TRUE, add regression line equation

- xcor, ycor:

  `numeric` Coordinates (in data units) to be used for absolute
  positioning of the correlation coefficients

- xequ, yequ:

  `numeric` Coordinates (in data units) to be used for absolute
  positioning of the regression line equation

- ...:

  Passed to
  [`lehuynh_theme()`](https://le-huynh.github.io/lehuynh/reference/lehuynh_theme.md)

## Value

A ggplot object

## Examples

``` r
if (FALSE) { # \dontrun{

library(brms)

mod <- brm(count ~ zAge + zBase * Trt + (1|patient) + (1|obs),
           data = epilepsy,
           family = poisson())

ppc_brms(mod)
ppc_brms(mod, dy = c(0.02, 0.1), dx = c(0.005, 0.1))
ppc_brms(mod, cor = TRUE, equation = TRUE, yequ = 100)
} # }
```
