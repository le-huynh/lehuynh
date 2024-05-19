#' Save a plot - Elsevier figure size
#'
#' Save a plot using [ggplot2::ggsave()].
#' Plot size follows instructions of Elsevier journals.
#'
#' @param filename A character string. File name to create on disk.
#' @param plot Plot to save, ggplot or other grid object.
#' @param width Plot width. See __Details__ for more information.
#' @param height Plot height in "mm".
#' @param ... Passed to [ggplot2::ggsave()]
#'
#' @return An image file containing the saved plot.
#' @export
#'
#' @details
#' Instruction of Elsevier about [sizing of artwork](https://www.elsevier.com/about/policies-and-standards/author/artwork-and-media-instructions/artwork-sizing).
#' * Image width:
#'   + single column: 90 mm (255 pt)
#'   + 1.5 column: 140 mm (397 pt)
#'   + double column (full width): 190 mm (539 pt)
#' * Image height: maximum 240 mm.
#'
#' @seealso [ggplot2::ggsave()]
#'
#' @examplesIf FALSE
#' library(ggplot2)
#'
#' mtcars$cyl <- factor(mtcars$cyl)
#'
#' fig <- ggplot(mtcars, aes(y = mpg, x = disp, color = cyl)) +
#'            geom_point()
#'
#' ggsave_elsevier("fig.pdf", plot = fig, width = "full_page", height = 200)

ggsave_elsevier <- function(filename,
                            plot,
                            width = c("one_column",
                                      "one_half_column",
                                      "full_page"),
                            height,
                            ...) {
          if (height >= 240) {
                    warning("The maximum page height is 240 mm.")
          }

          width <- match.arg(width)
          if (width == "one_column")      {width_val <- 90}
          if (width == "one_half_column") {width_val <- 140}
          if (width == "full_page")       {width_val <- 190}

          ggplot2::ggsave(filename = filename,
                          plot = plot,
                          width = width_val,
                          height = height,
                          units = "mm",
                          ...)
          }
