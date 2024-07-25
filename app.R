# app.R

# Cargar UI
source("src/ui.R")

# Cargar servidor
source("src/server.R")

shinyApp(ui = ui, server = server)
