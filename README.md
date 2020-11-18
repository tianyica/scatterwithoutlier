# scatterwithoutlier

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.com/tianyica/scatterwithoutlier.svg?branch=main)](https://travis-ci.org/tianyica/scatterwithoutlier)


The purpose of `scatterwithoutlier` is to create scatterplot for two quantitative variables with labeled outliers. 

Use `scatterwithoutlier` to:

  - Create and meld distributions using a wide pallet of base forms and
    tools.
  - Draw properties from those distributions.

Many distributions in practice are built in “layers”, by transforming
and combining other distributions. The result is a tailored distribution
that does not follow a basic parametric form such as “Normal” or
“Exponential”. The motivation behind the name of `distplyr` is that
distributions are built by manipulation, akin to the package `dplyr`.


## Design Choices

`scatterwithoutlier`:

  - Keeps all components of a distribution together in a single object.
  - Computes only when needed, by dispatching an appropriate S3 method
    on call.
  - Manages the discrete components of all distributions, often arising
    from empirical estimates.

## Basic Usage

``` r
library(scatterwithoutlier)
```


``` r
```

Evaluate functional representations, such as the cdf and hazard
function:

``` r
```

Make a mixture distribution by combining some distributions:

``` r
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" style="display: block; margin: auto;" />

Make a graft distribution by replacing a distribution’s tail:

``` r
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" style="display: block; margin: auto;" />

## Installation

`scatterwithoutlier` is not on CRAN yet, so the best way to install it is:

``` r
devtools::install_github("tianyica/scatterwithoutlier")
```
-----

Please note that the ‘distplyr’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
