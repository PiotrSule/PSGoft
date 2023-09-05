#' @title Modified Lilliefors Goodness-of-fit Normality Test
#'
#' @description
#' Calculates the statistic of the modified Lilliefors goodness-of-fit normality test (see Sulewski P. (2019)).
#'
#' @param x a numeric vector of data values, the number of which must be greater than 4.
#'
#' @rdname MLF.stat
#'
#' @details
#' The modified Lilliefors goodness-of-fit statistic, see formula (5) in the article.
#'
#' @author
#' Piotr Sulewski, \email{piotr.sulewski@apsl.edu.pl}, Pomeranian University in Slupsk.
#'
#' @references
#' {Sulewski, P. (2019). \emph{Modified Lilliefors Goodness-of-fit Test for Normality.} Communications in Statistics - Simulation and Computation 51(3), 1199-1219.}
#'
#' @examples
#' MLF.stat(rnorm(33, mean = 0, sd = 2))
#' MLF.stat(data1)
#'
#' @import moments
#'
#' @export


MLF.stat <- function(x) {
  complete.cases <- NULL
  pnorm <- NULL
  sd <- NULL
  x <- sort(x[complete.cases(x)])
  n <- length(x)
  if (n < 5)
    stop("sample size must be greater than 4")
  s <- skewness(x)
  k <- kurtosis(x) - 3
  if ((s > 0 & k > 0) | (s > 0 & k < 0)) {a <- 0; b <- 1}
  if ((s < 0 & k > 0) | (s < 0 & k < 0)) {a <- 1; b <- 0}
  if (s == 0 & k > 0) {a <- 1; b <- 1}
  if (s == 0 & k < 0) {a <- 0; b <- 0}
  p <- pnorm((x - mean(x)) / sd(x))
  stat <- max(abs((seq(1 : n) - a)/(n - a - b + 1) - p))
  return(stat)
}




