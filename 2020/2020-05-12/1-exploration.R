library(readxl)
library(tidyverse)

volcano <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-12/volcano.csv')
eruptions <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-12/eruptions.csv')
events <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-12/events.csv')
tree_rings <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-12/tree_rings.csv')
sulfur <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-12/sulfur.csv')

# ========== Countries by number of eruptions =============
most_confirmed_country <- eruptions %>% 
  filter(eruption_category == 'Confirmed Eruption') %>% 
  left_join(volcano %>% select(volcano_number, country), by = c('volcano_number')) %>% 
  group_by(country) %>% 
  summarise(
    n_eruptions = n()
  )
