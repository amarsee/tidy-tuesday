library(readxl)
library(tidyverse)
library(tmap)
library(sf)

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

# ============= Plot of eruptions ===============
eruptions_sf <- st_as_sf(eruptions %>% filter(!is.na(vei)), coords = c("longitude","latitude"), remove = FALSE)
data("World")

# tmap_mode('view')
tmap_mode("plot")
tm_shape(World) +
  tm_polygons() +
tm_shape(eruptions_sf) + 
  tm_symbols(col = 'red', size = 'vei', scale = 1.25, alpha = 0.1) + 
  tm_layout(legend.outside.position =  "bottom",
            asp=1.1)









