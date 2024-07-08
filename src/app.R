# src/app.R

# Cargar UI
source("ui.R")

# Cargar servidor
source("server.R")

shinyApp(ui = ui, server = server)
