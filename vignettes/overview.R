## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(kableExtra)
library(readr)
library(dplyr)
library(ggplot2)
library(sf)

## ---- warning = FALSE, message = FALSE, error = TRUE, eval=FALSE---------
#  # read in food desert .csv
#  worcfd <- read_csv("C:/Users/Brenna Robeson/OneDrive/Masters_Research_Project/Empirics/GIS_Analysis/extdata/DesAtlas_2015_WorcSel.csv")
#  
#  # filter out Worcester-relevant data
#  worcfd <- worcfd %>% filter(CensusTract %in% 25027727100:25027761300)
#  
#  # view first few rows of data
#  head(worcfd)

## ---- warning = FALSE, message = FALSE, fig.width=6, fig.height=4, fig.align='center', eval=FALSE----
#  # read in ej pop data
#  maejpop <- read_sf("C:/Users/Brenna Robeson/OneDrive/Masters_Research_Project/Empirics/GIS_Analysis/extdata/EJ_POLY.shp")
#  
#  # project maejpop to EPSG:32618, WSG84 UTM Zone 18N
#  maejpop <- st_transform(x = maejpop, crs = st_crs("+proj=utm +zone=18 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"))
#  
#  # filter out Worcester-only data and view first few rows
#  ejpop <- maejpop %>% st_as_sf() %>% filter(TOWN == "WORCESTER")
#  head(ejpop)
#  
#  # plot ejpop with EJ_CRITERI
#  ejpopplot <- ggplot(ejpop) +
#    geom_sf(aes(fill = EJ_CRITERI), legend = polygon) +
#    scale_fill_brewer(palette = "Dark2") +
#    ggtitle("EJ Populations in Worcester, MA") +
#    scale_fill_manual(values = c("#1B9E77", "#D95F02", "#7570B3", "#E7298A", "#66A61E"), labels = c("Income", "Minority", "Minority and English Isolation", "Minority and Income", "Minority, Income, and English Isolation"), name = "EJ Population\nCriteria")
#  ejpopplot
#  
#  # save output to a .png
#  ggsave("C:/Users/Brenna Robeson/OneDrive/GEOG346/worcfoodaccess/figures/a6_ejpop.png", plot = ejpopplot, #device = NULL, path = "C:/Users/Brenna Robeson/OneDrive/IDCE30109/emilee_boscrime/a6_ejpop.png",
#    scale = 1, limitsize = TRUE)

## ---- echo = FALSE, out.width="100%"-------------------------------------
knitr::include_graphics("../figures/a6_ejpop.png")

## ---- warning = FALSE, message = FALSE, fig.width=6, fig.height=4, fig.align='center', eval=FALSE----
#  # read in parcel shape file
#  parcels <- read_sf("C:/Users/Brenna Robeson/OneDrive/Masters_Research_Project/Empirics/GIS_Analysis/extdata/Basemap_Parcels_Polygons.shp")
#  head(parcels)
#  
#  # project parcels to EPSG:32618, WSG84 UTM Zone 18N
#  parcels <- st_transform(x = parcels, crs = st_crs("+proj=utm +zone=18 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")) %>% st_as_sf()
#  
#  # intersect parcel data wtih object from ejpop census block group to show subset of parcel data
#  testarea <- ejpop %>% slice(1) %>% st_as_sf
#  # par(mar = rep(0, 4))
#  # plot(st_geometry(parcels), col = "grey")
#  # plot(st_geometry(testarea), col = "purple", add = TRUE)
#  parcels_testarea <- st_intersection(x = testarea, y = parcels)
#  par(mar = rep(0, 4))
#  #plot(st_geometry(parcels), col = "grey")
#  parcels_subset <- plot(st_geometry(parcels_testarea), col = rainbow(n = nrow(parcels_testarea)))
#  
#  # save output to a .png
#  ggsave("C:/Users/Brenna Robeson/OneDrive/GEOG346/worcfoodaccess/figures/a6_parcels_subset.png", plot = parcels_subset, scale = 1, limitsize = TRUE)

## ---- echo = FALSE, out.width="100%"-------------------------------------
knitr::include_graphics("../figures/a6_parcels_subset.png")

## ---- warning = FALSE, message = FALSE, fig.width=6, fig.height=4, fig.align='center', eval=FALSE----
#  # read in zoning shape file
#  zoning <- read_sf("C:/Users/Brenna Robeson/OneDrive/Masters_Research_Project/Empirics/GIS_Analysis/extdata/Basemap_Zoning.shp")
#  head(zoning)
#  
#  # project zoning to EPSG:32618, WSG84 UTM Zone 18N
#  zoning <- st_transform(x = zoning, crs = st_crs("+proj=utm +zone=18 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")) %>% st_as_sf()
#  
#  # colourCount <- length(unique(zoning$NAME))
#  # getPalette <- colorRampPalette(brewer.pal((n = length(colourCount)), "Set1"))
#  #
#  # ggplot(mtcars) +
#  #   geom_histogram(aes(factor(hp)), fill=getPalette(colourCount)) +
#  #   theme(legend.position="right")
#  
#  # plot zoning by NAME
#  zoningplot <- ggplot(zoning) +
#    geom_sf(aes(fill = NAME), legend = polygon) +
#    ggtitle("Zoning Parcels in Worcester, MA") +
#    theme(legend.position='none')
#  zoningplot
#  
#  # save output to a .png
#  ggsave("C:/Users/Brenna Robeson/OneDrive/GEOG346/worcfoodaccess/figures/a6_zoning.png", plot = zoningplot, #device = NULL, path = "C:/Users/Brenna Robeson/OneDrive/IDCE30109/emilee_boscrime/a6_ejpop.png",
#    scale = 1, limitsize = TRUE)

## ---- echo = FALSE, out.width="100%"-------------------------------------
knitr::include_graphics("../figures/a6_zoning.png")

## ---- warning = FALSE, message = FALSE, error = TRUE, echo = FALSE, eval=FALSE----
#  nm <- c("Worcester City Boundary", "Census Tracts for Worcester, MA", "Census Block Groups for Worcester, MA",  "Worcester Property Parcel Ownership Database", "Worcester Parking Surfaces", "Worcester Driveway Surfaces"
#  )
#  sr <- c("MassGIS", "MassGIS", "MassGIS", "City of Worcester", "City of Worcester", "City of Worcester")
#  yr <- c("2014", "2010", "2010", "2019", "2019", "2019")
#  dft <- c("Shapefile", "Shapefile", "Shapefile", "Geodatabase Table", "Shapefile", "Shapefile")
#  notes <- c("Extracting Worcester boundary", "Along with Food Desert criteria, Vehicle avilibility and rentership rates data will also be joined with census tract geometry", "Needed to supplement the MA Environmental Justice Populations data, which only includes information on block groups meeting its criteria", "Geodatabase table to be joined with Parcels shapefile layer", "Polygons created from raster data to analyze aspect of automobility infrastructure in city", "With parking surfaces data, will provide information on automobility infrastructure")
#  
#  DF <- data.frame(nm, sr, yr, dft, notes)
#  colnames(DF) <- c("Name", "Source", "Year", "Data Format", "Notes")
#  kable(DF)

## ---- warning = FALSE, message = FALSE, error = TRUE, echo = FALSE-------
Timeframe  <-  c("April 22 – 29", "April 30 – May 2", "May 3 - 4", "May 5 - 6")
Goals <- c("* Explore trends in and nature of data files you will need to clean and manipulate\ \n* Explore trends in and nature of data files you will need to clean and manipulate", "* Create Food Desert choropleth map\ \n* Create Environmental Injustice Populations choropleth map\ \n*  Acquire census data on vehicle availability by census tract\ \n*  Finish geocoding mailing addresses of property owners", " * Complete draft of Rent Extraction map\ \n* Create automobility and zoning outputs\ \n* Draft Introduction and Methods sections of vignette", "* Draft Results and Discussion sections of vignette\ \n*  Ensure all coded results render without errors and as intended\ \n* Review cleanliness of vignette output")
DF <- data.frame(Timeframe, Goals)
colnames(DF) <- c("Timeframe", "Goals")
kable(DF)               

