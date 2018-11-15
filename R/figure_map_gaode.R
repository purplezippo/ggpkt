#
# lon_lat_df <- data.frame(
#   link = c('道路 1', '道路 1', '道路 1', '道路 2', '道路 2'),
#   Lng = c(116.3103, 116.3103, 116.3101, 116.3100, 116.3103),
#   Lat = c(39.91814, 39.91961, 39.94624, 39.94694, 39.93921)
# )
#
# link_status <- data.frame(
#   link = c('道路 1', '道路 2'),
#   realtime_status = c('畅通', '拥堵')
# )
#
# library(sp)
# points2spline <- function(df, id_field){
#   data <- as.matrix(df[,c('Lng', 'Lat')])
#   id = df[1, id_field]
#   Lines(list(Line(data)), ID=id)
# }
#
#
# splines_to_splinesdf <- function(splines, data, id_field) {
#   ids <- data.frame(names(splines))
#   colnames(ids) <- id_field
#   join_name <- join(ids, data)
#   row.names(join_name) <- join_name[, id_field]
#   splinesdf <- SpatialLinesDataFrame(splines, data=join_name)
#   # proj4string(splinesdf) <- CRS(“+init=epsg:4326”) # 设置投影坐标系，leaflet 可以不用设置
#   return(splinesdf)
# }
#
#
# link_info <- split(lon_lat_df, lon_lat_df[,'link'])
# names(link_info) <- NULL # 不加这个leaflet不能正常识别，应该是leaflet的bug
# Sl <- SpatialLines(plyr::llply(link_info, points2spline, 'link'))
# Sldf <- splines_to_splinesdf(Sl, data=link_status, id_field='link')
#
#
#
#
#
# AmapBlack <- rgb(0,0,0,1)
# AmapRed <- rgb(1,0,0,1)
# AmapYellow <- rgb(1, 219/255, 67/255, 1)
# AmapGreen <- rgb(0, 1, 0, 1)
# amapPalVec <- c(AmapGreen, AmapYellow, AmapRed, AmapBlack)
# factpal <- colorFactor(amapPalVec, domain=Sldf$realtime_status)
#
#
# m <-
#   leaflet(Sldf) %>%
#   addTiles(
#     'http://webrd02.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}',
#     tileOptions(tileSize=256, minZoom=9, maxZoom=20),
#     group='高德地图'
#   ) %>%
#   setView(116.40,39.90, zoom = 10) %>%
#   addPolylines(color=~factpal(realtime_status), weight=8,opacity=1, group='实时路况') %>%
#   addLayersControl(
#     overlayGroups = c('高德地图', '实时路况'),
#     options = layersControlOptions(collapsed = FALSE)
#   ) %>%
#   addLegend('bottomleft', pal = factpal, values = ~realtime_status,
#             title = '实时交通',
#             opacity = 1
#   )
# m
