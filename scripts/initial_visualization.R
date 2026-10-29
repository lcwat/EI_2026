# initial data visualization

# load libraries ----------------------------------------------------------

library(tidyverse)

# load data ---------------------------------------------------------------

myd <- read_csv('data/cleaned/ei_35_pp_cleaned.csv')

glimpse(myd)

# visualization -----------------------------------------------------------

myd |> 
  ggplot(aes(x = ei_irt)) + 
  geom_histogram(fill = 'red') + 
  theme_bw()

myd |> 
  ggplot(aes(x = ei_irt, fill = as.factor(pid))) + 
  geom_density() + 
  geom_vline(xintercept = 10) + 
  scale_fill_viridis_d(guide = 'none', option = 'mako', end = .8) +
  theme_bw() + 
  facet_wrap(~pid, scales = 'free_y')

myd |> 
  group_by(pid, ei_power) |> 
  summarize(
    mean_irt = mean(ei_irt), 
    completion_time = unique(completion_time)
  ) |> 
  ggplot(aes(x = mean_irt, y = completion_time, color = as.factor(ei_power))) + 
  geom_point(shape = 1) + 
  geom_smooth(method = 'loess', se = F) + 
  theme_bw() + 
  facet_wrap(~ei_power)
  
