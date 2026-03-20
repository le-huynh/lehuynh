# Le-Huynh's ggplot2 theme

Le-Huynh's ggplot2 theme: white background, black axis, black text

## Usage

``` r
lehuynh_theme(base_size = 11, base_family = "", ...)
```

## Arguments

- base_size:

  Base font size

- base_family:

  Base font family

- ...:

  Passed to
  [`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html)

## Value

An object as returned by
[`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html)

## See also

[`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html),
[`ggplot2::theme_bw()`](https://ggplot2.tidyverse.org/reference/ggtheme.html)

## Examples

``` r
library(ggplot2)

fig <- ggplot(mtcars, aes(y = mpg, x = disp)) +
    geom_point(aes(colour = factor(cyl)))

fig


fig + lehuynh_theme()
```
