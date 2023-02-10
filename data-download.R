library(tidycensus)
library(tidyverse)
library(tigris)

dallas_bachelors <- 
  get_acs(geography = "tract",
          variables = "DP02_0068P",
          year = 2020,
          state = "TX",
          county = "Dallas",
          geometry = TRUE)

write_rds(dallas_bachelors, "data/dallas.rds")

us_median_age <- get_acs(
  geography = "state",
  variables = "B01002_001",
  year = 2019,
  survey = "acs1",
  geometry = TRUE,
  resolution = "20m"
) %>%
  shift_geometry()

write_rds(us_median_age, "data/median_age.rds")
