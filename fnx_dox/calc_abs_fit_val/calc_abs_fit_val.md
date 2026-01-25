---
layout: default
title: Compute Absolute Fitted Values
nav_order: 2

permalink: /R/functions/regression/
---

# Compute Absolute Fitted Values with Confidence Intervals, `calc_abs_fit_val`

[Link to script](https://github.com/Mohamed-Albirair/my-R-functions/blob/main/R/regression/calc_abs_fit_val.R)

[Main page](https://mohamed-albirair.github.io/my-R-functions/)

[Author's portfolio](https://mohamed-albirair.github.io/portfolio/)

## Purpose
This function calculates *absolute* predicted values (fitted values) from regression models for specific covariate combinations, with accompanying confidence intervals. This is in contrast to the *relative* predicted values that are typically reported in regression model outputs.

## Key Features

- Works with any regression model family supported by `car::deltaMethod()` (`gaussian`, `binomial`, `poisson`... etc.)

- Allows exponentiation of estimates for models with log-link functions

- Computes Delta Method-based confidence intervals for the predicted values

- Returns publication quality-formatted results with user-specified decimal precision

## Mathematical Foundation

The function applies the **Delta Method** to compute:
\[
\hat{y} = g(\hat{\beta})
\]
with variance:
\[
\text{Var}(\hat{y}) = \nabla g(\hat{\beta})^T \cdot \text{Var}(\hat{\beta}) \cdot \nabla g(\hat{\beta})
\]
Where \(g(\cdot)\) represents the linear combination of parameters specified in `params`.

## Parameter Details

| Parameter  | Type              | Description                             | Example                                |
|------------|-------------------|-----------------------------------------|----------------------------------------|
| `model`    | Regression object | Fitted model (lm, glm, etc.)            | `lm(y ~ x1 + x2, data)`                |
| `params`   | Character string  | Linear combination of parameters        | `"(Intercept) + age*50 + treatment*1"` |
| `exp`      | Logical           | Exponentiate estimates (for log models) | `TRUE` for Poisson/logistic            |
| `n_digits` | Integer           | Decimal precision in output             | `3` for 0.123                          |


## Example Applications

```r
# Load function
source("https://raw.githubusercontent.com/Mohamed-Albirair/my-R-functions/main/calcAbsFitValue.R")
```

### Example 1: Linear model, predict at specific values

```r
linear_model <- lm(salary ~ experience + education, data = salary_data)
calc_abs_effect_val(
      model    = linear_model,
      params   = "(Intercept) + experience*10 + education*16",
      exp      = FALSE,
      n_digits = 2
)
```

### Example 2: Logistic model, exponentiate to get odds
```r
logistic_model <- glm(disease ~ age + bmi, data = health_data, family = binomial)
calc_abs_effect_val(
      model    = logistic_model,
      params   = "(Intercept) + age*45 + bmi*25",
      exp      = TRUE,  # Exponentiate log-odds to get odds
      n_digits = 4
)
```

### Example 3: Poisson model, predict expected counts
```r
poisson_model <- glm(count ~ time + dose, data = count_data, family = poisson)
calc_abs_effect_val(
      model    = poisson_model,
      params   = "(Intercept) + time*24 + dose*100",
      exp      = TRUE,  # Exponentiate log-rate to get rate
      n_digits = 1
)
```

## Output Structure

The function returns a data frame with:

- **Estimate**: Point prediction for the specified covariate combination

- **LCL**: Lower 95% confidence limit

- **UCL**: Upper 95% confidence limit

```r
# Sample output:
#           Estimate   LCL   UCL
# Effect     125.430 110.2 140.7
```

## Advanced Usage

### Custom Standard Errors
```r
# Use robust standard errors
calc_abs_effect_val(
      model  = your_model,
      params = "(Intercept) + x1*value1 + x2*value2",
      exp    = FALSE
)
# The function automatically uses vcov(model) - replace with sandwich::vcovHC() if needed
```

### Multiple Contrasts
```r
# Compute predictions for several scenarios
scenarios <- list(
      "Young_Low" = "(Intercept) + age*30 + bmi*22",
      "Old_High"  = "(Intercept) + age*65 + bmi*32"
)

lapply(scenarios, function(p) {
      calc_abs_effect_val(model = model, params = p, exp = TRUE)
})
```

## Technical Notes

- **Method**: Uses the Delta Method via `car::deltaMethod()` for variance estimation
- **Assumptions**: Requires model to have a `vcov()` method and support from `car::deltaMethod()`
- **Limitations**: Delta Method assumes asymptotic normality; may be less accurate with small samples
- **Alternatives**: For non-linear combinations, consider simulation-based methods



