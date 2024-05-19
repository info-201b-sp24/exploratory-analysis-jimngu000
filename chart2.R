library(ggplot2)
library(tidyverse)
library(dplyr)

chart2_data <- read.csv("C:/Users/wildm/info201/datasets/socialmedia/smmh.csv") 
long_title = "Relationship Between Age And Tendency To Compare Onself To Others Via Social Media (2023)"
plot <- ggplot(social_media_mental, aes(x = chart2_data$X1..What.is.your.age., 
                                        y = chart2_data$X15..On.a.scale.of.1.5..how.often.do.you.compare.yourself.to.other.successful.people.through.the.use.of.social.media.)) +
  geom_point() +
  labs(
    title = paste(strwrap(long_title, width = 50), collapse = "\n"),
    x = "Age",
    y = "Frequency of comparing oneself to others on social media"
  )

print(plot)