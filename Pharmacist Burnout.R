# Load required libraries
library(ggplot2)
library(tidyverse)

# Create the dataset with actual standard errors
data <- data.frame(
  work_setting = rep(c("Hospital pharmacy", "Independent community pharmacy", 
                       "Chain pharmacy", "Others"), each = 4),
  hours = factor(rep(c("1-20", "21-40", "41-60", "60+"), times = 4),
                 levels = c("1-20", "21-40", "41-60", "60+")),
  burnout = c(
    # Hospital pharmacy
    NA, 25.092, 25.493, 33.737,
    # Independent community
    21.611, 26.237, 29.544, NA,
    # Chain
    NA, 28.237, 16.212, NA,
    # Others
    20.487, 20.537, 25.236, 26.712
  ),
  se = c(
    # Hospital pharmacy
    NA, 1.823, 1.383, 2.940,
    # Independent community
    4.331, 4.111, 2.331, NA,
    # Chain
    NA, 2.237, 2.933, NA,
    # Others
    2.331, 2.537, 2.236, 2.712
  )
)

# Create the plot
ggplot(data, aes(x = work_setting, y = burnout, fill = hours)) +
  geom_bar(stat = "identity", 
           position = position_dodge(width = 0.9),
           width = 0.9) +
  geom_errorbar(aes(ymin = burnout - se, ymax = burnout + se),
                position = position_dodge(width = 0.9),
                width = 0.25) +
  scale_fill_manual(values = c("1-20" = "grey70",
                               "21-40" = "grey50",
                               "41-60" = "grey30",
                               "60+" = "grey10")) +
  labs(x = "Work Setting",
       y = "Mean Burnout\nScore",
       fill = "Weekly Working Hours") +
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 0, hjust = 0.5),
    axis.text = element_text(color = "black"),
    legend.position = "top"
  ) +
  scale_y_continuous(limits = c(0, 35))