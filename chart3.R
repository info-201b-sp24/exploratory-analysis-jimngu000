library(ggplot2)
library(tidyverse)
library(dplyr)

new_dataframe <- industry %>%
  group_by(no_employees) %>%
  summarise(mental_resources = sum(benefits == "Yes")) %>%
  select(no_employees, mental_resources)

long_title = "Company Mental Health Benefits Per Company Size (2014)"
plot <- ggplot(new_dataframe, aes(x = c("1-5", "6-25", "26-100", "100-500", "500-1000", "More than 1000"), 
                                  y = new_dataframe$mental_resources)) +
  geom_bar(stat = 'identity') +
  labs(
    title = paste(strwrap(long_title, width = 50), collapse = "\n"),
    x = "Number of employees",
    y = "# of companies that provide mental health benefits"
  )

print(plot)