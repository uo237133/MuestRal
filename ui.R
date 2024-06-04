# ui.R
library(shiny)
library(shinythemes)

# Define la interfaz de usuario
ui <- fluidPage(
  theme = shinytheme("cerulean"),
  titlePanel("Cálculo del Tamaño Muestral"),
  sidebarLayout(
    sidebarPanel(
      selectInput("sampling_type", "Tipo de Muestreo",
                  choices = list("Simple sin Reposición" = "sin_reposicion",
                                 "Simple con Reposición" = "con_reposicion")),
      conditionalPanel(
        condition = "input.sampling_type == 'sin_reposicion'",
        numericInput("sd", "Desviación Estandar (sd)", value = 1),
        numericInput("conf_level", "Nivel de Confianza (conf_level)", value = 0.95, step = 0.01),
        numericInput("margin_error", "Margen de Error (margin_error)", value = 0.05, step = 0.01)
      ),
      conditionalPanel(
        condition = "input.sampling_type == 'con_reposicion'",
        numericInput("p", "Proporción (p)", value = 0.5, step = 0.01),
        numericInput("conf_level_repos", "Nivel de Confianza (conf_level)", value = 0.95, step = 0.01),
        numericInput("margin_error_repos", "Margen de Error (margin_error)", value = 0.05, step = 0.01)
      ),
      actionButton("help", "Ayuda")
    ),
    mainPanel(
      verbatimTextOutput("result")
    )
  )
)
