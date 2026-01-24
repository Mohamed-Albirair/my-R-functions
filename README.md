


# Custom R Functions for Streamlined Analysis

A collection of R functions designed to automate common analytical tasks and improve workflow efficiency.

## Installation & Usage

Load any function directly into your R session using:

``` r
source("<function-URL>")
```

Replace `<function-URL>` with the corresponding raw GitHub link provided for each function.

___

## Core Utilities

### Logical Operator for Vectors

#### `%!in%` ([source](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/notin.R))
  
Logical complement to `%in%`. Returns TRUE for elements not present in a vector. Elements could be single values or vectors.

``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/notin.R")
c("a", "b") %!in% c("b", "c", "d")  # returns: TRUE, FALSE
```

### Data Completeness

#### `report_missing` ([source](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/report_missing.R))
  
Generates a comprehensive missingness report for data frames, including counts and percentages by variable.
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/report_missing.R")
report_missing(your_dataframe)
```

___

## Regression Analysis Toolkit

### Regression Model Output Reporting

#### `report_mod_out_knitr` ([source](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/report_mod_out_knitr.R))
  
Extracts and formats regression outputs for publication-ready reporting. Compatible with linear, generalized linear, and mixed-effects models.

Features:

- Extracts coefficients with confidence intervals

- Generates interpretative summaries

- Enables inline referencing of estimates in text using `in-line coing`

- Supports knitr integration
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/report_mod_out_knitr.R")
model <- glm(outcome ~ predictor1 + predictor2, data = df, family = <gaussian/binomial/poisson... etc>)
report_mod_out_knitr(mod) # report output
```

### Absolute Fitted Values Calculation and Reporting

#### calc_abs_effect_val ([source](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/calcAbsFitValue.R))

Computes absolute fitted values from regression models for specific parameter combinations. See [link](https://<username>.github.io/<repo-name>/fnx_doc/calc_abs_fit_val/calc_abs_fit_val.html) for documentation.

``` r
source("calc_abs_effect_val")
mod <- glm(y ~ a + bx, data, family = <binomial, poisson... etc.>) # desired regression model
# e.g., report fitted values at point x = 4
calc_abs_effect_val(model = mod, parms = (e.g., "(Intercept) + a + b * 4"))
```

___

## Epi Conversions

  * [prob_to_rate](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/prob_to_rate.R): from probability to rate
  
$$
r = \frac{-\ln (1 - p)}{t}
$$
  
  * [rate_to_prob](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/rate_to_prob.R): from rate to probability
  
$$
p = 1 - exp ^ {(r \times t)}
$$
  
  * [conv_trans_prob](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/conv_trans_prob.R): convert transition probabilities between different time units


<!-- Your content above -->

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [['$','$'], ['\\(','\\)']],
      displayMath: [['$$','$$'], ['\\[','\\]']],
      processEscapes: true
    }
  });
</script>
<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML">
</script>
  
$$
tp_b = 1 - (1 - tp_a) ^ {b / a}
$$
  
