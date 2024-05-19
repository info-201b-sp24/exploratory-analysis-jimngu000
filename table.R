library(tidyverse)
library(dplyr)
library(knitr)

industry <- read.csv("https://github.com/info-201b-sp24/exploratory-analysis-jimngu000/blob/main/survey.csv")

table <- industry %>%
  group_by(Country) %>%
  summarise(
    total = n(),
    count_yes_bene = sum(benefits == "Yes"),
    ratio_bene = count_yes_bene / total,
    count_yes_mental = sum(mental_vs_physical == "Yes"),
    ratio_mental = count_yes_mental / total
  ) %>%
  select(Country, total, ratio_bene, ratio_mental)

kable(table,
      col.names = c("Country", "Number of Responses", 
                    "% of Employers Providing Mental Health Benefits",
                    "% of Employees Believing Employers Treat Mental And Physical Health Equally"),
      digits = 3)