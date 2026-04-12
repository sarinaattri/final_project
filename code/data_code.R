library(ggeffects)
library(ggplot2)
library(labelled)
library(gtsummary)
library(here)
library(broom)
library(broom.helpers)

here::i_am("code/data_code.R")

data_source <- here::here("heart_failure_clinical_records_dataset.csv")

# read in data
data <- read.csv(data_source, header = TRUE)

# label variables for table
var_label(data) <- list(
  age = "Age (years)",
  anaemia = "Anaemia",
  creatinine_phosphokinase = "Creatinine Phosphokinase (mcg/L)",
  diabetes = "Diabetes",
  ejection_fraction = "Ejection Fraction (%)",
  high_blood_pressure = "High Blood WPressure",
  platelets = "Platelet Count (kiloplatelets/mL)",
  serum_creatinine = "Serum Creatinine (mg/dL)",
  serum_sodium = "Serum Sodium (mEq/L)",
  sex = "Male Sex",
  smoking = "Smoker",
  time = "Follow-Up Period (days)",
  DEATH_EVENT = "Died During Follow-Up Period"
)

# save data
saveRDS(data, file = here::here("output", "data.rds"))