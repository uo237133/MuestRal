# app.R
library(shiny)

# Archivos necesarios
source("formulas.R")
source("ui.R")
source("server.R")
source("help_text.R")

# Corre la aplicación
shinyApp(ui = ui, server = server)
