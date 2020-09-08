#' Elevation Map
#'
#' The function creates elevation map with 2 Raster Layers
#' @param locations A dataframe --> set map boundaries
#' @param z The zoom level. Range [1,14]
#' @param dsn data source name of Polygonal file -> shape/ boundary of map.
#' Download .zip file from [diva-gis](https://www.diva-gis.org/gdata).
#' Corresponding file format = SHAPEFILE (.shp)
#'
#' @export
#' @import elevatr raster rgdal ggplot2 tidyverse scales
#' @importFrom tidyverse %>%
#'
#' @example
#'
#' library(here)
#' locations <- data.frame(x=c(96.635742, 106.171875), y=c(5.397273, 21.084500))
#' dsn = here("Data","elevation_map", "THA_adm", "THA_adm0.shp")
#' Thai_map <- elevation_map (locations = locations, dsn = dsn)

elevation_map <-
          function(locations,
                   z = 6,
                   dsn
                   )
          {

prj4 <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"

bg_rst <- get_elev_raster(locations = locations,
                             prj = prj4,
                             z = z,
                             clip = "locations")

tp_ext <- readOGR(dsn = dsn)

tp_rst <- mask(bg_rst, tp_ext)

bg_rst_df <- as.data.frame(bg_rst, xy = TRUE) %>%
          mutate(alpha = rescale(layer, to =c(0.25,0.75)))

tp_rst_df <- as.data.frame(tp_rst, xy = TRUE) %>%
          mutate(alpha = ifelse(is.na(layer), 0, 1))

scale_parm <- 2

gmap <- ggplot() +
          geom_raster(data = bg_rst_df,
                      aes(x = x, y = y, alpha = alpha)) +
          geom_raster(data = tp_rst_df,
                      aes(x = x, y = y, fill = layer, alpha = alpha)) +
          scale_fill_gradientn(colours = terrain.colors(100, rev = TRUE),
                               name = "Elevation (m)") +
          scale_alpha(guide = "none") +
          coord_quickmap() +
          theme_minimal() +
          scale_x_continuous(limits = unlist(locations[1]),
                             expand = c(0, 0)) +
          scale_y_continuous(limits = unlist(locations[2]),
                             expand = c(0, 0)) +
          labs(x = "Longitude (E)", y = "Latitude (N)") +
          theme(panel.grid = element_blank(),
                panel.background = element_blank()) +
          theme(axis.title = element_text(size = 6 * scale_parm),
                axis.text = element_text(size = 6 *  scale_parm)) +
          theme(legend.key.width = unit(0.2 * scale_parm, "cm"),
                legend.key.height = unit(0.5 * scale_parm, "cm"),
                legend.text = element_text(size = 5 * scale_parm),
                legend.title = element_text(size = 6 * scale_parm))

}
