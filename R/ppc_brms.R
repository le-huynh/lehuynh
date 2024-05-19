#' Fitted versus observed plot for brmsfit Objects
#'
#' Plot fitted versus observed values, including confidence interval
#' (gray area) around best fit line (linear regression line) and
#' prediction interval (dashed line).
#'
#' @param object An object of class __brmsfit__
#' @param xtitle The text for the x-axis title
#' @param ytitle The text for the y-axis title
#' @param dy     Distance from plot to y-axis
#' @param dx     Distance from plot to x-axis
#' @param cor    If TRUE, add correlation coefficients with p-values and R
#' @param equation If TRUE, add regression line equation
#' @param xcor,ycor \code{numeric} Coordinates (in data units) to be used for
#'        absolute positioning of the correlation coefficients
#' @param xequ,yequ \code{numeric} Coordinates (in data units) to be used for
#'        absolute positioning of the regression line equation
#' @param ...    Passed to [lehuynh::lehuynh_theme()]
#'
#' @return A plot
#' @export
#' @importFrom stats lm predict
#'
#' @examplesIf FALSE
#' library(brms)
#'
#' mod <- brm(count ~ zAge + zBase * Trt + (1|patient) + (1|obs),
#'            data = epilepsy,
#'            family = poisson())
#'
#' ppc_brms(mod)
#' ppc_brms(mod, dy = c(0.02, 0.1), dx = c(0.005, 0.1))
#' ppc_brms(mod, cor = TRUE, equation = TRUE, yequ = 100)

ppc_brms = function(object,
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
                    ...)

{
          ppDat  <- brms::pp_check(object, type = "intervals")
          ppDat2 <- ppDat$data

          mod <- lm(h ~ y_obs, data = ppDat2)
          pp  <- predict(mod, interval = "prediction")
          myDat <- cbind(ppDat2, pp)

fig <- ggplot2::ggplot(myDat, ggplot2::aes(y_obs, h)) +
          ggplot2::geom_point() +
          ggplot2::stat_smooth(method = lm,
                               color = "black") +
          ggplot2::geom_line(ggplot2::aes(y = lwr),
                             color = "black",
                             linetype = "dashed")+
          ggplot2::geom_line(ggplot2::aes(y = upr),
                             color = "black",
                             linetype = "dashed") +
          ggplot2::geom_vline(xintercept = 0,
                              linetype = 3) +
          ggplot2::geom_hline(yintercept = 0,
                              linetype = 3) +
          ggplot2::labs(x = xtitle,
                        y = ytitle) +
  ggplot2::scale_x_continuous(expand = ggplot2::expansion(mult = dy)) +
  ggplot2::scale_y_continuous(expand = ggplot2::expansion(mult = dx)) +
          lehuynh::lehuynh_theme(...)

if (cor == TRUE) fig <- fig +
          ggpubr::stat_cor(ggplot2::aes(label = paste(..rr.label..,
                                                      ..p.label..,
                                                      sep = "~`,`~")),
                           label.x = xcor,
                           label.y = ycor)

if (equation == TRUE) fig <- fig +
          ggpubr::stat_regline_equation(label.x = xequ,
                                        label.y = yequ)

fig
}
