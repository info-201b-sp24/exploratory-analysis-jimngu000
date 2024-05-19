library(ggplot2)
library(tidyverse)
library(dplyr)

chart1_data <- read.csv("C:/Users/wildm/info201/datasets/techindustry/survey.csv")

chart1_data <- chart1_data %>%
  group_by(no_employees) %>%
  summarise(mental_resources = sum(benefits == "Yes")) %>%
  select(no_employees, mental_resources)

long_title = "Company Mental Health Benefits Per Company Size (2014)"
plot <- ggplot(chart1_data, aes(x = c("1-5", "6-25", "26-100", "100-500", "500-1000", "More than 1000"), 
                                  y = chart1_data$mental_resources)) +
  geom_bar(stat = 'identity') +
  labs(
    title = paste(strwrap(long_title, width = 50), collapse = "\n"),
    x = "Number of employees",
    y = "# of companies that provide mental health benefits"
  )

print(plot)