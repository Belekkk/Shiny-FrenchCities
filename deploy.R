# Install devtools
install.packages('devtools')
library(devtools)
# Install shinyapps
devtools::install_github('rstudio/packrat')
devtools::install_github('rstudio/shinyapps')
library(packrat)
library(shinyapps)
# Authorize account
shinyapps::setAccountInfo(name='axelbellec', 
                          token='72F693A6C01EC2A169A21705DE0F59F6', 
                          secret='iHGcBkx2XDbOHEU61Cdb1Z2pE8jAhZ0UqXsJNAr7')
# Deploy
shinyapps::deployApp('/Users/axelbellec/Documents/GitHub/Shiny-FrenchCities/')
