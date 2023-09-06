#' @title Modified Lilliefors Goodness-of-Fit Normality Test
#'
#' @description
#' Performs the modified Lilliefors goodness-of-fit normality test.
#'
#' @param x a numeric vector of data values, the number of which must be greater than 4.
#'
#' @rdname MLF.test
#'
#' @details
#' The modified Lilliefors goodness-of-fit normality test statistic, see formula (5) in the article.
#'
#' @return
#' A list with class “htest” containing the following components:
#'
#' \code{statistic} - the value of the modified Lilliefors statistic.
#'
#' \code{p.value} - the p-value for the test.
#'
#' \code{method} - the character string “Modified Lilliefors goodness-of-fit normality test”.
#'
#' \code{data.name} - a character string giving the name(s) of the data.
#'
#' @author
#' Piotr Sulewski, \email{piotr.sulewski@apsl.edu.pl}, Pomeranian University in Slupsk.
#'
#' @references
#' {Sulewski, P. (2019). \emph{Modified Lilliefors Goodness-of-fit Test for Normality.} Communications in Statistics - Simulation and Computation 51(3), 1199-1219.}
#'
#' @examples
#' \donttest{MLF.test(rnorm(33, mean = 0, sd = 2))}
#' \donttest{MLF.test(data1)}
#'
#' @import moments
#'
#' @export

MLF.test <- function(x) {
  complete.cases <- NULL
  NameD <- deparse(substitute(x))
  x <- sort(x[complete.cases(x)])
  RVal <- list(statistic = c(D = MLF.stat(x)), p.value = MLF.pvalue(x),
              method = "Modified Lilliefors goodness-of-fit normality test",
              data.name = NameD)
  class(RVal) <- "htest"
  return(RVal)
}

