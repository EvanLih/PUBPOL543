final_data <- read.csv("Final Data - Sheet1.csv")

library(ggplot)
library(magrittr)
library(tidyr)

data <- table(final_data$Continent, final_data$Income.Group)

data_mgCol <- prop.table(data,margin = 2) 

data_mgCol %<>% as.data.frame() %>%
  rename("Continent"= Var1) %>%
  rename("incomeStatus" = Var2)

ggplot(data_mgCol, aes(Country, Freq)) +
  geom_bar(stat = "Identity", fill=  "#3CA3B2") +
  facet_grid(~ incomeStatus) +
  coord_flip() +
  theme_stata() +
  theme(axis.text.y = element_text(angle = 45)) +
  ggtitle("Income Distribution by Continent") +
  xlab("Continent") +
  ylab("Frequency")
