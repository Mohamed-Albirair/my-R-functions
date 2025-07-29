<script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML">
</script>


# My Custom Functions

Functions to automate common analyses.

To use any of the functions below, simply run the `source()` command and input the corresponding URL (hyperlink) as an argument, as demonstrated below:

``` r
# R code:
source(<URL>)
```

___

## Misc Functions

  * [%!in%](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/notin.R): "not in", a logical function to test whether object x is not included in object y.

``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/notin.R")
```

  * [report_missing](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/report_missing.R): reports missingness in a data frame.
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/report_missing.R")
report_missing(data)
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
  
