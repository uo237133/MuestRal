# server.R
library(shiny)

# Carga las fórmulas desde el archivo externo
source("formulas.R")

# Define el servidor
server <- function(input, output) {
  
  observeEvent(input$calc, {
    n <- calcular_tamano_muestral_media(
      sd = input$sd,
      conf_level = input$conf_level,
      margin_error = input$margin_error
    )
    
    output$sample_size <- renderText({
      paste("El tamaño muestral necesario es:", n)
    })
  })
}
