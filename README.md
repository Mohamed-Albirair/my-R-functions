---
layout: default
title: Home
nav_order: 1
permalink: /
---

# Overveiw

This is a collection of R functions designed to automate common analytical tasks and improve workflow efficiency.

# Installation and Usage

Load any function directly into your R session using:

``` r
source("<function-URL>")
```

Replace `<function-URL>` with the corresponding raw GitHub link provided for each function.

___

# Functions

## [Report Statistical Regression Model Output](https://mohamed-albirair.github.io/my-R-functions/fnx_dox/report_mod_out_knitr/)

Extracts and reports statistical regression model outputs with publication-quality formatting. Compatible with linear, generalized linear, and mixed-effects models, and generates templates for output interpretation. For documentation, see [link](https://mohamed-albirair.github.io/my-R-functions/fnx_dox/report_mod_out_knitr/).
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/report_mod_out_knitr.R")
model <- glm(outcome ~ predictor1 + predictor2, data = df, family = <gaussian/binomial/poisson... etc>)
report_mod_out_knitr(mod) # report output
```

___

## [Compute Absolute Fitted Values with Confidence Intervals](https://mohamed-albirair.github.io/my-R-functions/fnx_dox/calc_abs_fit_val)

Computes absolute fitted values from regression models for specific parameter combinations. For documentation, see [link](https://mohamed-albirair.github.io/my-R-functions/fnx_dox/calc_abs_fit_val/calc_abs_fit_val.html).

``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/regression/report_mod_out_knitr.R")
mod <- glm(y ~ a + bx, data, family = <binomial, poisson... etc.>) # desired regression model
# e.g., report fitted values at point x = 4
calc_abs_effect_val(model = mod, parms = (e.g., "(Intercept) + a + b * 4"))
```

___

## Epi Conversions

### [Convert from Probability to Rate](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/epi/prob_to_rate.R)
  
$$
r = \frac{-\ln (1 - p)}{t}
$$
  
``` r
# Call function
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/epi/prob_to_rate.R")
prob_to_rate(time = 1, prob = 0.3)
```

### [Convert from Rate to Probability](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/epi/rate_to_prob.R)
  
$$
p = 1 - exp ^ {(r \times t)}
$$

``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/epi/rate_to_prob.R")
rate_to_prob(time = 1, prob = 1.203973)
```

### [Convert Transition Probabilities between Different Time Units](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/epi/conv_trans_prob.R)

$$
tp_b = 1 - (1 - tp_a) ^ {b / a}
$$
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/epi/conv_trans_prob.R")
conv_trans_prob(tp = 0.3, ratio = 1 / 12) # This converts an annual 30% TP to a monthly TP
```

___

## Miscellaneous Functions

### [Logical Operator for Vectors](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/misc/notin.R)

This is the logical complement to `%in%`. Returns TRUE for elements not present in a vector. Elements could be single values or vectors.

``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/misc/notin.R")
c("a", "b") %!in% c("b", "c", "d")  # returns: TRUE, FALSE
```

### [Report Data Completeness](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/misc/report_missing.R)

This function generates a comprehensive missingness report for data frames, including counts and percentages by variable.
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/misc/report_missing.R")
report_missing(your_dataframe)
```

### [Convert between Annual and Hourly Salary Rates](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/misc/calc_salary.R)

``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/misc/calc_salary.R")
calc_salary(val  = 75,       # salary value
            rate = "hourly", # value above is hourly rate
            days = 5,        # days worked
            fte  = 1)        # full-time equivalent, 100% 
```

## `ggplot2` Visualization Themes

### [Chris Adoph's Theme](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/viz_ggplot/theme_caviz.R)

``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/viz_ggplot/theme_caviz.R")
# add `theme_caviz` to your `ggplot` script
```
