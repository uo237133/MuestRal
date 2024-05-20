# app.R
library(shiny)

# Asegúrate de que los archivos ui.R y server.R estén en el mismo directorio que este archivo
source("ui.R")
source("server.R")

# Corre la aplicación
shinyApp(ui = ui, server = server)
