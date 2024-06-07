# app.R

library(shiny)

# Archivos necesarios
source("ui.R")
source("server.R")

# Corre la aplicación
shinyApp(ui = ui, server = server)
