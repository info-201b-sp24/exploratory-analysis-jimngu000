library(ggplot2)
library(tidyverse)
library(dplyr)

chart3_data <- read.csv("C:/Users/wildm/info201/datasets/socialmedia/smmh.csv")
chart3_data <- chart3_data %>%
  group_by(X4..Occupation.Status) %>%
  summarise(
    total = n(),
    at_most_2_hrs = sum(X8..What.is.the.average.time.you.spend.on.social.media.every.day. == "Between 1 and 2 hours" |
                        X8..What.is.the.average.time.you.spend.on.social.media.every.day. == "Less than an Hour"),
    ratio = (at_most_2_hrs / total) * 100
  )
long_title = "% Using Less Than Or Equal To 2 Hours Of Social Media Per Day, By Occupation (2023)"
plot <- ggplot(chart3_data, aes(x = chart3_data$X4..Occupation.Status,
                                y = chart3_data$ratio)) +
  geom_bar(stat = 'identity') +
  labs(
    title = paste(strwrap(long_title, width = 50), collapse = "\n"),
    x = "Occupation",
    y = "% using at most 2 hours of social media daily"
  )

print(plot)