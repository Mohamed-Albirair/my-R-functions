lm_reg <- function(data,
                   IDV,
                   tbl_names){
      # model <- lm(Ratio ~ rep(1:ageCount, each = each_val) + scnd_var, weights = Var ^ (-1), data = data)
      data <- data %>% mutate(Age = order(ageGroups_label)[match(AgeGroup, ageGroups_label)])
      # model <- lm(paste("Ratio ~ Age +", paste0(scnd_var)), weights = Var ^ (-1), data = data)
      
      model <- lm(paste("Ratio ~", paste(IDV, collapse = "+")), weights = Var ^ (-1), data = data)
      
      source("https://raw.githubusercontent.com/SenshiKudo/my-R-functions/main/lmOutputExtract.R")
      lmOutputExtract(model) %>%
            `rownames<-`({{tbl_names}})
}