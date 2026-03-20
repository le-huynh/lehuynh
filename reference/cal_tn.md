# Calculate Total Nitrogen (TN) Concentration

This function calculates Total Nitrogen (TN) concentration for samples
using spectrophotometric data. It fits a linear model for each sample
based on blank measurements and an undigested nitrate standard, then
derives concentration estimates from model coefficients.

## Usage

``` r
cal_tn(data, blank_name, undigested_std = "NO3ud", dilution_rate = 1.5)
```

## Arguments

- data:

  A data frame or tibble containing spectral measurements. Must include
  a column `No.` identifying samples, and multiple columns representing
  absorbance values at different wavelengths.

- blank_name:

  A character vector specifying the sample IDs in `No.` that correspond
  to blank measurements.

- undigested_std:

  A character string specifying the sample ID in `No.` corresponding to
  the undigested nitrate standard. Default is `"NO3ud"`.

- dilution_rate:

  A numeric value used to scale the measured concentration determined
  based on ratio between sample volume and digestion solution volume to
  obtain actual concentration. Default is `1.5`.

## Value

A tibble containing:

- Sample identifier (`No.`)

- Model coefficients (`(Intercept)`, `NO3ud`, `blank`)

- Calculated TN concentration

## Examples

``` r
# example dataset
lehuynh::TN_raw_data
#>        No. wl200 wl210 wl220 wl230 wl250
#> 1    NO3ud 0.685 0.576 0.263 0.058 0.001
#> 2       B1 0.268 0.035 0.020 0.011 0.006
#> 3       B2 0.264 0.032 0.018 0.010 0.005
#> 4       B3 0.265 0.034 0.021 0.013 0.009
#> 5       B4 0.261 0.033 0.019 0.012 0.008
#> 6       B5 0.265 0.037 0.023 0.015 0.010
#> 7     STD1 0.720 0.425 0.200 0.056 0.013
#> 8     STD2 0.723 0.423 0.198 0.054 0.011
#> 9     STD3 0.705 0.410 0.190 0.048 0.007
#> 10 sample1 0.900 0.570 0.262 0.063 0.007
#> 11 sample2 0.928 0.596 0.275 0.069 0.011
#> 12 sample3 0.938 0.604 0.278 0.073 0.013
#> 13 sample4 0.755 0.452 0.210 0.055 0.011
#> 14 sample5 0.758 0.456 0.210 0.054 0.010
#> 15 sample6 0.781 0.469 0.217 0.058 0.011

cal_tn(data = TN_raw_data,
       blank_name = c("B1", "B2", "B3", "B4", "B5"),
       undigested_std = "NO3ud",
       dilution_rate = 1.5)
#> # A tibble: 15 × 5
#>    No.     `(Intercept)`     NO3ud     blank concentration
#>    <chr>           <dbl>     <dbl>     <dbl>         <dbl>
#>  1 NO3ud        0         1        -7.33e-16      1.5     
#>  2 B1          -0.00155   0.00369   1.01e+ 0      0.00553 
#>  3 B2          -0.00246   0.000140  1.01e+ 0      0.000209
#>  4 B3           0.00121  -0.00255   1.00e+ 0     -0.00382 
#>  5 B4           0.000100 -0.00221   9.92e- 1     -0.00332 
#>  6 B5           0.00270   0.000933  9.89e- 1      0.00140 
#>  7 STD1         0.00487   0.671     9.64e- 1      1.01    
#>  8 STD2         0.00268   0.670     9.87e- 1      1.01    
#>  9 STD3        -0.00164   0.656     9.71e- 1      0.985   
#> 10 sample1     -0.00266   0.934     9.93e- 1      1.40    
#> 11 sample2      0.00108   0.973     9.84e- 1      1.46    
#> 12 sample3      0.00326   0.981     9.92e- 1      1.47    
#> 13 sample4      0.00165   0.723     9.76e- 1      1.08    
#> 14 sample5      0.000218  0.732     9.69e- 1      1.10    
#> 15 sample6      0.00180   0.750     1.00e+ 0      1.12    
```
