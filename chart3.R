library(ggplot2)
library(tidyverse)
library(dplyr)

chart3_data <- read.csv("C:/Users/wildm/info201/datasets/socialmedia/smmh.csv")

long_title = "Relationship between age and tendency to compare onself to others via social media (2023)"
plot <- ggplot(chart3_data, aes(x = chart3_data$X4..Occupation.Status,
                                y = chart3_data$X8..What.is.the.average.time.you.spend.on.social.media.every.day)) +
  geom_bar(stat = 'identity') +
  labs(
    title = paste(strwrap(long_title, width = 50), collapse = "\n"),
    x = "Age",
    y = "Frequency of comparing oneself to others on social media"
  )

print(plot)