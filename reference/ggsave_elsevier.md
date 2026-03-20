# Save a plot - Elsevier figure size

Save a plot using
[`ggplot2::ggsave()`](https://ggplot2.tidyverse.org/reference/ggsave.html).
Plot size follows instructions of Elsevier journals.

## Usage

``` r
ggsave_elsevier(
  filename,
  plot,
  width = c("one_column", "one_half_column", "full_page"),
  height,
  ...
)
```

## Arguments

- filename:

  A character string. File name to create on disk.

- plot:

  Plot to save, ggplot or other grid object.

- width:

  Plot width. See **Details** for more information.

- height:

  Plot height in "mm".

- ...:

  Passed to
  [`ggplot2::ggsave()`](https://ggplot2.tidyverse.org/reference/ggsave.html)

## Value

An image file containing the saved plot.

## Details

Instruction of Elsevier about [sizing of
artwork](https://www.elsevier.com/about/policies-and-standards/author/artwork-and-media-instructions/artwork-sizing).

- Image width:

  - single column: 90 mm (255 pt)

  - 1.5 column: 140 mm (397 pt)

  - double column (full width): 190 mm (539 pt)

- Image height: maximum 240 mm.

## See also

[`ggplot2::ggsave()`](https://ggplot2.tidyverse.org/reference/ggsave.html)

## Examples

``` r
library(ggplot2)

fig <- ggplot(mtcars, aes(y = mpg, x = disp)) +
    geom_point(aes(colour = factor(cyl)))

## For demo, a temp. file path is created with the file extension .png
png_file <- tempfile(fileext = ".png")

ggsave_elsevier(png_file, plot = fig, width = "full_page", height = 120)
```
