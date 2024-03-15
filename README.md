# my-R-functions
Functions to automate common analyses.

To use any of the functions below, simply run the `source()` command and input the corresponding URL (hyperlink) as an argument, as demonstrated below:

``` r
# R code:
source(<URL>)
```

___

## Misc Functions

  * [%!in%](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/notin.R): "not in"
  
___

## Extracting Regression Analysis Outputs

### Linear, Single-Level Model Outputs

  * [modOutput](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/modOutput.R)
  
``` r
source(https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/modOutput.R)
mod <- lm(y ~ a + bx, data) # desired regression model
modOutput(mod) # for reporting the output
```
  
### Non-Linear, Single-Level Model Outputs

  * [modOutput](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/modOutput.R)
     - (input `TRUE` to the `expCoef` argument, to exponentiate coefficients)

``` r
source(https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/modOutput.R)
mod <- lm(y ~ a + bx, data) # desired regression model
modOutput(mod, expCoef = TRUE) # for reporting the exponentiated output
```

### Non-Linear, Multi-Level Model Outputs

  * [nonlinearMLMOutputExtract](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/logitMLMOutputExtract.R)

___

## Epi Conversions

  * [probToRate](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/probToRate.R): from probability to rate
  
$$r = \frac{-\ln (1 - p)}{t}$$
  
  * [rateToProb](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/rateToProb.R): from rate to probability
  
$$p = 1 - exp ^ {(r \times t)}$$
  
  * [convTransProb](https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/convTransProb.R): convert transition probabilities between different time units
  
$$tp_b = 1 - (1 - tp_a) ^ {b / a}$$
  
