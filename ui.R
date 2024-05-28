# ui.R
library(shiny)

# Define la interfaz de usuario
ui <- fluidPage(
  titlePanel("Calculadora de Tamaño Muestral"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("mean", "Media Estimada:", value = 50),
      numericInput("sd", "Desviación Estándar Estimada:", value = 10),
      numericInput("conf_level", "Nivel de Confianza (0-1):", value = 0.95, min = 0, max = 1),
      numericInput("margin_error", "Margen de Error:", value = 5),
      actionButton("calc", "Calcular")
    ),
    
    mainPanel(
      textOutput("sample_size")
    )
  )
)