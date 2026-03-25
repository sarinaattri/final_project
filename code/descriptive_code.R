library(ggeffects)
library(ggplot2)
library(labelled)
library(gtsummary)
library(here)

here::i_am("code/descriptive_code.R")

data <- readRDS(file = here::here("output", "data.rds"))


# create well-formatted table
descriptive_table <- data %>%
  mutate(DEATH_EVENT = factor(DEATH_EVENT,
                              levels = c(0,1),
                              labels = c("Survived Follow-Up", "Died During Follow-Up"))) %>%
  tbl_summary(by = DEATH_EVENT) %>%
  add_overall() %>% 
  modify_caption("**Table 1.** Patient Characteristics, Heart Failure Patients in Punjab, Pakistan Hospital From April to December 2015 (n=299)")

# save table
saveRDS(descriptive_table, file = here::here("output", "table1.rds"))