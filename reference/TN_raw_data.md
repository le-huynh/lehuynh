# Raw data for Total Nitrogen calculation

An example dataset containing spectrophotometric measurements across
multiple wavelengths.

## Usage

``` r
TN_raw_data
```

## Format

### `TN_raw_data`

A dataframe with 15 rows and 6 columns:

- No.:

  Character. Sample identifier. Includes:

  - `"NO3ud"`: undigested nitrate standard

  - `"B1"`–`"B5"`: blank samples

  - `"STD1"`–`"STD3"`: standard samples

  - `"sample1"`–`"sample6"`: unknown samples

- wl200:

  Numeric. Absorbance at 200 nm

- wl210:

  Numeric. Absorbance at 210 nm

- wl220:

  Numeric. Absorbance at 220 nm

- wl230:

  Numeric. Absorbance at 230 nm

- wl250:

  Numeric. Absorbance at 250 nm
