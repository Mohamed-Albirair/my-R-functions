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

  * [%!in%](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/notin.R): "not in"

``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/notin.R")
```

  * [missSummary](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/missSummary.R): report missingness summary
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/missSummary.R")
missSummary(data)
```
___

## Extract Regression Analysis Outputs

### Regression Model Output

  * [reportModelOutputKnitr](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/reportModelOutputKnitr.R)
  
    - Can work for single-, multi-level, linear and non-linear models!
  
``` r
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/reportModelOutputKnitr.R")
mod <- lm(y ~ a + bx, data) # desired regression model
reportModelOutputKnitr(mod) # report output
```

### Report Absolute Fitted Values

  * [calAbsFitValue](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/calcAbsFitValue.R)
  
``` r
source("calAbsFitValue")
mod <- glm(y ~ a + bx, data, family = <binomial, poisson... etc.>) # desired regression model
# report fitted values at point x = 4
calAbsFitValue(model = mod, parms = (e.g., "(Intercept) + a + b * 4"))
```

___

## Epi Conversions

  * [probToRate](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/probToRate.R): from probability to rate
  
$$
r = \frac{-\ln (1 - p)}{t}
$$
  
  * [rateToProb](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/rateToProb.R): from rate to probability
  
$$
p = 1 - exp ^ {(r \times t)}
$$
  
  * [convTransProb](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/convTransProb.R): convert transition probabilities between different time units
  
$$
tp_b = 1 - (1 - tp_a) ^ {b / a}
$$
  
