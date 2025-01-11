# Load required libraries
library(ggplot2)
library(tidyverse)

# Create the dataset with actual standard errors
data <- data.frame(
  work_setting = rep(c("Chain pharmacy", "Hospital pharmacy", 
                       "Independent community pharmacy", "Others"), each = 2),
  Meditation = factor(rep(c("No", "Yes"), times = 4),
                      levels = c("No", "Yes")),
  CS = c(
    # Chain pharmacy
    34.154, NA,
    # Hospital pharmacy
    33.541, 34.637,
    # Independent community
    33.46, 32.521,
    # Others
    35.518, 37.379
  ),
  se = c(
    # Chain pharmacy
    2.798, NA,
    # Hospital pharmacy
    2.237, 3.222,
    # Independent community
    3.086, 3.879,
    # Others
    1.951, 3.178
  )
)

# Create the plot
ggplot(data, aes(x = work_setting, y = CS, fill = Meditation)) +
  geom_bar(stat = "identity", 
           position = position_dodge(width = 0.9),
           width = 0.9) +
  geom_errorbar(aes(ymin = CS - se, ymax = CS + se),
                position = position_dodge(width = 0.9),
                width = 0.25) +
  scale_fill_manual(values = c("No" = "grey70",
                               "Yes" = "grey10")) +
  labs(x = "Work Setting",
       y = "Mean Compassion\nSatisfaction Score",
       fill = "Meditation") +
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 0, vjust = 0.5),
    axis.text = element_text(color = "black"),
    legend.position = "top"
  ) +
  scale_y_continuous(limits = c(0, 42))