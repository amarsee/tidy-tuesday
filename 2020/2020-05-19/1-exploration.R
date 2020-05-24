# Volleyball data
# From both AVP and FIVB international tournaments

library(tidyverse)

vb_matches <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-19/vb_matches.csv', guess_max = 76000)

summary(vb_matches)

colSums(is.na(vb_matches))

avp_winning_teams <- vb_matches %>% 
  mutate(team_name = paste(w_player1, w_player2, sep = '/')) %>% 
  filter(circuit == 'AVP') %>% 
  group_by(team_name, year) %>% 
  summarise(
    n_wins = n()
  )


