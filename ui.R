library(shiny)
library(leaflet)
library(magrittr)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("France - Largest Cities"),
  
  # Sidebar with controls 
  sidebarLayout(
    sidebarPanel(
      h3("Filtering data"),
      selectInput("dataset", "Choose a dataset (or a subset) :", 
                  choices = sort(c("all biggest cities", "Ile-de-France", "Provence-Alpes-Cote d'Azur", "Rhone-Alpes", 
                              "Midi-Pyrenees", "Pays de la Loire", "Alsace", "Languedoc-Roussillon", "Aquitaine", "Nord-Pas-de-Calais")))
    ), 

    # MainPanel divided into 2 tabPanels
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", h1("Leaflet Map"), leafletOutput("leafletMap", width = "100%", height="700")),
        tabPanel("Table", h1("Data"), tableOutput("table"))
      ) 
    )
  )
))
