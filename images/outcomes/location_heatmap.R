library(emaph)
library(ggplot2)
library(gridExtra)
library(ggmap)

get_location_heat_map <- function(
  location_data = NULL,
  map_center = 'Sloterdijk, Amsterdam', zoom = 11) {
  
  d <- round(location_data[c("lat", "lon")], 4)
  d <- unique(d)
  
  zaandam <- get_map(location = 'Sloterdijk, Amsterdam', zoom = 11)
  ggmap(zaandam, extent = "panel", darken = 0) + 
    geom_density2d(data = d, aes(x = lon, y = lat), size = .1, color = "black") + 
    stat_density2d(data = d, aes(x = lon, y = lat, 
                                 fill = ..level.., alpha = ..level..), 
                   size = 0.01, bins = 200, geom = "polygon") + 
    scale_fill_gradientn(colours = topo.colors(10), guide = FALSE) + 
    scale_alpha(range = c(0, .3), guide = FALSE)
}

d1 <- subset(locations, id == 1)
g1 <- get_location_heat_map(d1)

d2 <- subset(locations, id == 2)
g2 <- get_location_heat_map(d2)

both <- grid.arrange(g1, g2, nrow = 1)

png(filename="images/outcomes/location_heat_map.png",
    width = 1000, height = 400)
grid.arrange(g1, g2, nrow = 1)
dev.off()

