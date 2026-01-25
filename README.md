---
layout: default
title: Home
nav_order: 1
permalink: /
---

# Overveiw

This is a collection of R functions designed to automate common analytical tasks and improve workflow efficiency.

## Installation and Usage

Load any function directly into your R session using:

``` r
source("<function-URL>")
```

Replace `<function-URL>` with the corresponding raw GitHub link provided for each function.

___

## Regression Analysis Toolkit

## [Regression Model Output Reporting](https://mohamed-albirair.github.io/my-R-functions/fnx_dox/report_mod_out_knitr/report_mod_out_knitr.md)

Extracts and formats regression outputs for publication-ready reporting. Compatible with linear, generalized linear, and mixed-effects models.

Features:

- Generates interpretative summaries

- Enables inline referencing of estimates in text using `in-line coing`

- Supports knitr integration for publication-quality reporting
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/report_mod_out_knitr.R")
model <- glm(outcome ~ predictor1 + predictor2, data = df, family = <gaussian/binomial/poisson... etc>)
report_mod_out_knitr(mod) # report output
```

### [Compute Absolute Fitted Values with Confidence Intervals](https://mohamed-albirair.github.io/my-R-functions/fnx_dox/calc_abs_fit_val/calc_abs_fit_val.md)

`calc_abs_fit_val` ([link](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/calcAbsFitValue.R))

Computes absolute fitted values from regression models for specific parameter combinations. For documentation, see [link](https://mohamed-albirair.github.io/my-R-functions/fnx_dox/calc_abs_fit_val/calc_abs_fit_val.html).

``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/regression/report_mod_out_knitr.R")
mod <- glm(y ~ a + bx, data, family = <binomial, poisson... etc.>) # desired regression model
# e.g., report fitted values at point x = 4
calc_abs_effect_val(model = mod, parms = (e.g., "(Intercept) + a + b * 4"))
```

___

## Epi Conversions

### Convert from Probability to Rate

[prob_to_rate](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/epi/prob_to_rate.R)
  
$$
r = \frac{-\ln (1 - p)}{t}
$$
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/epi/prob_to_rate.R")
```

### Convert from Rate to Probability

[rate_to_prob](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/epi/rate_to_prob.R)
  
$$
p = 1 - exp ^ {(r \times t)}
$$

``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/epi/rate_to_prob.R")
```

### Convert Transition Probabilities between Different Time Units
  * [conv_trans_prob](hhttps://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/epi/conv_trans_prob.R)

$$
tp_b = 1 - (1 - tp_a) ^ {b / a}
$$
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/epi/conv_trans_prob.R")
```

___

## Miscellaneous Functions

### Logical Operator for Vectors

`%!in%` ([link](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/misc/notin.R))
  
Logical complement to `%in%`. Returns TRUE for elements not present in a vector. Elements could be single values or vectors.

``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/misc/notin.R")
c("a", "b") %!in% c("b", "c", "d")  # returns: TRUE, FALSE
```

### Data Completeness

`report_missing` ([link](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/misc/report_missing.R))
  
Generates a comprehensive missingness report for data frames, including counts and percentages by variable.
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/misc/report_missing.R")
report_missing(your_dataframe)
```


  
