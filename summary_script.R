library(tidyverse)
library(dplyr)

social_media_mental <- read.csv("https://github.com/info-201b-sp24/exploratory-analysis-jimngu000/blob/main/smmh.csv")

summary_info <- list()

summary_info$depression_most_likely <- social_media_mental %>%
  group_by(X4..Occupation.Status) %>%
  summarise(
    total = n(),
    count_5 = sum(X18..How.often.do.you.feel.depressed.or.down. == "5"),
    ratio = count_5 / total
  ) %>%
  arrange(desc(ratio)) %>%
  slice_head() %>%
  select(X4..Occupation.Status, ratio)

summary_info$lowest_age <- social_media_mental %>%
  filter(X1..What.is.your.age. == min(X1..What.is.your.age.)) %>%
  pull(X1..What.is.your.age.) %>%
  unique()

summary_info$highest_age <- social_media_mental %>%
  filter(X1..What.is.your.age. == max(X1..What.is.your.age.)) %>%
  pull(X1..What.is.your.age.) %>%
  unique()

summary_info$most_common_media <- social_media_mental %>%
  count(X7..What.social.media.platforms.do.you.commonly.use.) %>%
  filter(n == max(n)) %>%
  pull(X7..What.social.media.platforms.do.you.commonly.use.)

summary_info$common_usage <- social_media_mental %>%
  count(X8..What.is.the.average.time.you.spend.on.social.media.every.day.) %>%
  filter(n == max(n)) %>%
  pull(X8..What.is.the.average.time.you.spend.on.social.media.every.day.)