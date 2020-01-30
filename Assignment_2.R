
library(tidyverse)
library(magrittr)

setwd(dirname(rstudioapi::getSourceEditorContext()$path))

access_Renewable <- read.csv("access_Renewable.csv", check.names = FALSE)
renewable_consumption <- read.csv("renewable_Consumption.csv",  check.names = FALSE)
arable_Land <- read.csv("Arable_Land.csv",  check.names = FALSE)

 access_Renewable %<>%
  select("Country Name", `1990`:`2005`) %>%
    gather(`1990`:`2005`, key = "Year", value = "access_Renewable(%)")
 
 renewable_consumption %<>%
   select("Country Name", `1990`:`2005`) %>%
   gather(`1990`:`2005`, key = "Year", value = "renewable_Consumption(%)")
 
 arable_Land %<>%
   select("Country Name", `1990`:`2005`) %>%
   gather(`1990`:`2005`, key = "Year", value = "arable_Land(%)")
 
 merged_data <- full_join(access_Renewable, arable_Land, by = "Country Name")
 
 final_mergedData <- left_join(merged_data, renewable_consumption, by = "Country Name")
 