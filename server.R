# Useful packages
library(shiny)
library(leaflet)
library(magrittr)

## Read our .csv data
df <- read.csv("www/french_cities.csv", sep=";")

## Formatting PopUps
df = within(df, {
  PopUp = paste("<b>",df$City, "</b>")
  PopUp = paste(PopUp, df$Region, df$Population, sep="<br>")
})

## Define a new icon 
cityLeafIcon <- makeIcon(
  iconUrl = "www/city.png",
  iconAnchorX = 10, iconAnchorY = 10,
  shadowUrl = "www/city.png"
)

# Define server logic 
shinyServer(function(input, output) {
  datasetInput <- reactive({
    switch(input$dataset,
           "all biggest cities" = df,
           "Ile-de-France" = subset(df, df$Region == "Ile-de-France"),
           "Provence-Alpes-Cote d'Azur" = subset(df, df$Region == "Provence-Alpes-Cote d'Azur"),
           "Rhone-Alpes"  = subset(df, df$Region == "Rhone-Alpes"),
           "Midi-Pyrenees" = subset(df, df$Region == "Midi-Pyrenees"),
           "Pays de la Loire" = subset(df, df$Region == "Pays de la Loire"),
           "Alsace" = subset(df, df$Region == "Alsace"),
           "Languedoc-Roussillon" = subset(df, df$Region == "Languedoc-Roussillon"),
           "Aquitaine" = subset(df, df$Region == "Aquitaine"),
           "Nord-Pas-de-Calais" = subset(df, df$Region == "Nord-Pas-de-Calais"))
  })

  
  ## Show the entire table of our dataset
  output$table <- renderTable({
    datasetInput()[1:5]
  })
  
  
  ## Create and show our Leaflet Map
  output$leafletMap <- renderLeaflet({
    df <- datasetInput()
    map <- leaflet() %>% 
      addTiles() %>% 
      setView(1.846033, 46.97068, zoom = 6) %>% 
      addMarkers(data = df, lng = ~ Longitude, lat = ~ Latitude, popup = df$PopUp, icon = cityLeafIcon)
    map
  })
  
})