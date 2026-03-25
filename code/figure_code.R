library(ggeffects)
library(ggplot2)
library(labelled)
library(gtsummary)
library(here)

here::i_am("code/figure_code.R")

# read in model
glm1 <- readRDS(file = here::here("output", "glm1.rds"))

# create clean figure
figure1 <- plot(ggpredict(glm1, terms = c("serum_creatinine [all]", "sex"))) +
  labs(title="Figure 1. Predicted Probabilities of Dying During Follow-Up Period",
       y="Probability of Death",
       x = "Serum Creatinine (mg/dL)",
       color="Sex") +
  scale_color_discrete(labels = c("Female", "Male"))+
  scale_x_continuous(n.breaks=10)

# save figure
saveRDS(figure1, file = here::here("output", "figure1.rds"))
