#' @title Modified Lilliefors Goodness-of-fit Normality Test
#'
#' @description
#' Calculates the p - value of the modified Lilliefors goodness-of-fit normality test
#' (see Sulewski P. (2019)).
#'
#' @param x a numeric vector of data values, the number of which must be greater than 4.
#'
#' @rdname MLF.pvalue
#'
#' @details
#' The modified Lilliefors goodness-of-fit p-value,
#'
#' @author
#' Piotr Sulewski, \email{piotr.sulewski@apsl.edu.pl}, Pomeranian University in Slupsk.
#'
#' @references
#' {Sulewski, P. (2019). \emph{Modified Lilliefors Goodness-of-fit Test for Normality.} Communications in Statistics - Simulation and Computation 51(3), 1199-1219.}
#'
#' @examples
#' \donttest{MLF.pvalue(rnorm(33, mean = 0, sd = 2))}
#' \donttest{MLF.pvalue(data1)}
#'
#' @import moments
#'
#' @export

MLF.pvalue <- function(x){
  complete.cases <- NULL
  rnorm <- NULL
  x <- sort(x[complete.cases(x)])
  n <- length(x)
  if (n < 5)
    stop("sample size must be greater than 4")
  B <- 1e5
  xxx <- matrix(rnorm(n * B, 0, 1), nrow = B, ncol = n)
  H0 <- apply(xxx, 1, MLF.stat)
  pvalue <- length(H0[H0 > MLF.stat(x)]) / B
  return(pvalue)
}
