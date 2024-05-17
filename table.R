library(tidyverse)
library(dplyr)
library(knitr)

industry <- read.csv("C:/Users/wildm/info201/datasets/techindustry/survey.csv")

table <- industry %>%
  group_by(Country) %>%
  summarise(
    total = n(),
    count_yes_bene = sum(benefits == "Yes"),
    ratio_bene = count_yes_bene / total,
    count_yes_know = sum(care_options == "Yes"),
    ratio_know = count_yes_know / total
  ) %>%
  select(Country, total, ratio_bene, ratio_know)

kable(table,
      col.names = c("Country", "Number of Responses", "Ratio of Employers Providing Mental Health Benefits", "Ratio of Knowing Care Options Provided by Employers"))