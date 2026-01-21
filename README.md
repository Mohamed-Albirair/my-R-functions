


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
  
Logical complement to `%in%`. Returns TRUE for elements not present in a vector. Elements could single values or vectors.

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

## Extract Regression Analysis Outputs

### Regression Model Output

  * [report_mod_out_knitr](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/report_mod_out_knitr.R)
  
    - Can work for single-, multi-level, linear and non-linear models!
    
    - This function is designed to:
    
      * Report regression output coefficients
      
      * Provide structured interpretation of the different outputs
      
      * Allow extracting values from the model output and referencing them in embedded text descriptions using `in-line coing`.
      
      * Produce a publication-quality regression output 
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/report_mod_out_knitr.R")
mod <- glm(y ~ a + bx, data, , family = <binomial, poisson... etc.>) # desired regression model
report_mod_out_knitr(mod) # report output
```

### Report Absolute Fitted Values

  * [calc_abs_effect_val](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/calcAbsFitValue.R)
  
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
  
$$
tp_b = 1 - (1 - tp_a) ^ {b / a}
$$
  
