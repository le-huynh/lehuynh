#' Le-Huynh's ggplot2 theme
#'
#' Le-Huynh's ggplot2 theme: white background, black axis, black text
#'
#' @param base_size Base font size
#' @param base_family Base font family
#' @param ... Passed to [ggplot2::theme()]
#'
#' @return An object as returned by [ggplot2::theme()]
#' @export
#'
#' @seealso [ggplot2::theme()], [ggplot2::theme_bw()]
#'
#' @examples
#'
#' library(ggplot2)
#'
#' fig <- ggplot(mtcars, aes(y = mpg, x = disp)) +
#'     geom_point(aes(colour = factor(cyl)))
#'
#' fig
#'
#' fig + lehuynh_theme()


lehuynh_theme <- function(base_size = 11,
                          base_family = "",
                          ...) {
          ggplot2::theme_bw(base_size = base_size,
                            base_family = base_family) +
          ggplot2::theme(panel.border = ggplot2::element_blank(),
                         panel.grid.major = ggplot2::element_blank(),
                         panel.grid.minor = ggplot2::element_blank(),
                         axis.line = ggplot2::element_line(colour = "black"),
                         axis.text = ggplot2::element_text(colour = "black"),
                         ...
                         )
}
