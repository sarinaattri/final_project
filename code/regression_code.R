library(ggeffects)
library(ggplot2)
library(labelled)
library(gtsummary)
library(here)

here::i_am("code/regression_code.R")

# read in data
data <- readRDS(file = here::here("output", "data.rds"))

# fit logistic regression model
glm1 <- glm(DEATH_EVENT ~ ., data = data, family = binomial)

# create well-formatted regression results table
regression_table <- tbl_regression(glm1, exponentiate = TRUE) %>% 
  modify_caption("**Table 2.** Logistic Regression Model Results, Heart Failure Patients in Punjab, Pakistan Hospital From April to December 2015 (n=299)")

# save regression table and glm
saveRDS(glm1, file = here::here("output", "glm1.rds"))
saveRDS(regression_table, file = here::here("output", "table2.rds"))