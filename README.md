
# PSGoft: Modified Lilliefors Goodness-of-fit Normality Test

**author: Piotr Sulewski, Pomeranian University** <!-- badges: start -->
<!-- badges: end -->

The goal of the PSGoft package is to put into practice the (a,b)
modified Lilliefors goodness-of-fit normality test. This modification
consists in varying a formula of calculating the empirical distribution
function. Values of constants a, b in the formula depend on values of
sample skewness and excess kurtosis, which is recommended in order to
increase the power of the LF test. To read more about the package please
see (and cite :)) papers:

Sulewski P. (2019) Modified Lilliefors Goodness-of-fit Test for
Normality, Communications in Statistics - Simulation and Computation,
51(3), 1199-1219

## Installation

You can install the released version of **PSGoft** from CRAN with:

``` r
install.packages("PSGoft")
```

You can install the development version of **PSGoft** from
[GitHub](https://github.com/) with:

``` r
library("remotes")
remotes::install_github("PiotrSule/PSGoft")
```

**This package includes two real data sets**

The first one, **data1**, consist of 72 observations for Dozer Cycle
Times.

The second one, **data2**, is the height of 99 five-year-old British
boys in cm

``` r
library(PSGoft)
length(data1)
#> [1] 72
head(data2)
#> [1] 96.1 97.1 97.1 97.2 99.2 99.4
```

### Functions

**MLF.stat**

This function returns the value of the Modified Lilliefors
goodness-of-fit statistic

``` r
MLF.stat(data1)
#> [1] 0.05488005
MLF.stat(rnorm(33, mean = 0, sd = 2))
#> [1] 0.1145668
```

**MLF.pvalue**

This function returns the p-value for the test

``` r
MLF.pvalue(data1)
#> [1] 0.81555
MLF.pvalue(rnorm(33, mean = 0, sd = 2))
#> [1] 0.35721
```

**MLF.stat**

This function returns the value of the Modified Lilliefors statistic and
the p-value for the test.

``` r
MLF.test(data1)
#> 
#>  Modified Lilliefors goodness-of-fit test for normality
#> 
#> data:  data1
#> D = 0.05488, p-value = 0.8171
MLF.test(rnorm(33, mean = 0, sd = 2))
#> 
#>  Modified Lilliefors goodness-of-fit test for normality
#> 
#> data:  rnorm(33, mean = 0, sd = 2)
#> D = 0.10742, p-value = 0.3865
```
