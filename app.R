#app.R
#----------

library(shiny)

# Archivos necesarios
source("formulas.R")
source("help_text.R")
source("ui.R")
source("server.R")


# Corre la aplicación
shinyApp(ui = ui, server = server)
