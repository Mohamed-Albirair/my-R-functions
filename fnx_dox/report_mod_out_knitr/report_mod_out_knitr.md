---
layout: default
title: Report Statistical Regression Model Output
nav_order: 2
permalink: /fnx_dox/report_mod_out_knitr/
---

# Report Statistical Regression Model Output, `report_mod_out_knitr`

[Link to script](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/regression/report_mod_out_knitr.R)
  
[Main page](https://mohamed-albirair.github.io/my-R-functions/)

## Purpose
This function automates the generation of clean regression model outputs with coefficient values, 95% CIs and p-values.

## Key Features

- Incorporates coefficient interpretation by generating draft conclusions for each coefficient and describing positive/negative associations with appropriate language

- Produces publication-ready tables using `knitr` and `kableExtra` R packages for formatting

## Parameter Details

| Parameter      | Type              | Description                             | Remarks                                    |
|----------------|-------------------|-----------------------------------------|--------------------------------------------|
| `model`        | Regression object | Fitted model (lm, glm, etc.)            | `lm(y ~ x1 + x2, data)`                    |
| `exp`          | Logical           | Exponentiate estimates (for log models) | `TRUE` for Poisson/logistic                |
| `params`       | Character string  | Parameters' labels in output table      | User-defined labels for `x1`, `x2`... etc. |
| `n_digits`     | Integer           | Decimal precision in output             | `3` for 0.123                              |
| `caption_input`| Character         | Input for the `caption` argument.       | User-defined output label, default to none |
| `knitr_output` | Logical           | Produces publication-quality outputs    | `TRUE` for knitting                        |

## Example Applications

```r
# Call function
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/refs/heads/main/R/regression/report_mod_out_knitr.R")
```

``` r
# Fit regression model
linear_model <- lm(formula = slry ~ expr + edu,
                   data    = salary_data)

# Run function
report_mod_out_knitr(
      model         = linear_model,
      exp           = FALSE, # since the model is linear
      params        = c("Experience", "Edcuation"),
      n_digits      = 2,
      caption_input = "Association between salary, experience and education",
      knitr_output  = TRUE # for knitted outputs
)
```



