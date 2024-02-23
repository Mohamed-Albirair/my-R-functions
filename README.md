# my-R-functions
Functions to automate common analyses.

To use any of the functions below, simply run the `source()` command and input the corresponding hyperlink as an argument, as demonstrated below:

```
# R code:
source(--function name--)
```

___

## Misc Functions

  * [notin](https://raw.githubusercontent.com/SenshiKudo/my-R-functions/main/notin.R): "not in"
  
  
## Extracting Regression Analysis Outputs

### Linear, Single-Level Model Outputs

  * [lmOutputExtract](https://raw.githubusercontent.com/SenshiKudo/my-R-functions/main/lmOutputExtract.R)
  
  * [modOutput](https://raw.githubusercontent.com/SenshiKudo/my-R-functions/main/modOutput.R) *(Input `FALSE` to the `TorF` argument)*
  
### Non-Linear, Single-Level Model Outputs

  * [logitOutputExtract](https://raw.githubusercontent.com/SenshiKudo/my-R-functions/main/logitOutputExtract.R)

  * [modOutput](https://raw.githubusercontent.com/SenshiKudo/my-R-functions/main/modOutput.R) *(Input `TRUE` to the `TorF` argument)*
  
### Non-Linear, Multi-Level Model Outputs

  * [logitMLMOutputExtract](https://raw.githubusercontent.com/SenshiKudo/my-R-functions/main/logitMLMOutputExtract.R)

___

## Epi Conversions

  * [probToRate](https://raw.githubusercontent.com/SenshiKudo/my-R-functions/main/probToRate.R): from probability to rate
  
  * [rateToProb](https://raw.githubusercontent.com/SenshiKudo/my-R-functions/main/rateToProb.R): from rate to probability
  
  * [convTransProb](https://raw.githubusercontent.com/SenshiKudo/my-R-functions/main/convTransProb.R): convert transition probabilities between different time units
  

  
