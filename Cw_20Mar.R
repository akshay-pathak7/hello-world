install.packages("gapminder")
install.packages("tidyverse")
library(gapminder)
library(tidyverse)

ggplot(data = gapminder) +
  aes(x = gdpPercap, y = lifeExp, color = continent) +
  geom_point()

ggplot(data = gapminder) +
  aes(x = year, y = lifeExp, color = country) +
  geom_line() +
  guides(color ="none") 

gapminder_avg_continent_2007 <- gapminder %>% 
  filter(year == 2007) %>% 
  group_by(continent) %>% 
  summarise(m_lifeExp = mean(lifeExp))

ggplot(data = gapminder_avg_continent_2007) +
  aes(x = continent, y = m_lifeExp, fill = continent) +
  geom_col()

ggplot(data = gapminder) +
  aes(x = year, y = lifeExp, color = continent) +
  geom_line()

ggplot(data = gapminder) +
  aes(x = continent, y = lifeExp, color = continent) +
  geom_boxplot()

ggplot(data = gapminder) +
  aes(x = year, y = pop, fill = continent) +
  geom_col()

ggplot(data = gapminder) +
  aes(x = continent, y = lifeExp, fill = continent) +
  geom_boxplot()

ggplot(data = gapminder) +
  aes(x = continent, y = lifeExp, color = continent, fill = continent) +
  geom_boxplot()

options(scipen = 999)

scale_colour_discrete()

install.packages("maps")

pop_2007 <- gapminder %>% 
  filter(year == 2007)

map_world <- map_data("world") 

map_pop_2007 <- full_join(map_world, pop_2007, by = c("region" = "country"))

ggplot(data = map_pop_2007) +
  aes(x = long, y = lat, group = group, fill = pop) +
  geom_polygon()

ggplot(data = map_pop_2007) +
  aes(x = long, y = lat, group = group, fill = pop) +
  geom_polygon() +
  scale_fill_gradient(low = "yellow", high = "red", na.value = "grey") +
  labs(
    title = "Differences between countries regarding their population in 2007",
    subtitle = "Countries in grey have no data due to a mismatch with their names",
    caption = "Source: R package {gapminder}",
    x = "Longitude",
    y = "Latitude",
    fill = "Country Population"
  ) +
  theme_bw()

ggplot(gapminder) +
  geom_line(aes(x = year, y = lifeExp, group = country)) +
  geom_smooth(aes(x= year, y = lifeExp, colour = continent)) +
  facet_wrap(~continent)

ggplot(data = gapminder) +
  aes(x = continent, y = lifeExp, colour = continent) +
  geom_boxplot() = 
  facet_wrap(~year)


  