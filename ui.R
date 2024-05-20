# ui.R
library(shiny)

# Define la interfaz de usuario para la aplicación
ui <- fluidPage(
  titlePanel("Calculadora Avanzada de Tamaño Muestral"),
  sidebarLayout(
    sidebarPanel(
      selectInput("metodo", "Método de cálculo:",
                  choices = c("Método 1" = "m1", "Método 2" = "m2")),
      numericInput("numero", "Introduce un número:", value = 1, min = 0, step = 1),
      actionButton("calcular", "Calcular")
    ),
    mainPanel(
      textOutput("resultado_texto"),
      plotOutput("plot")
    )
  )
)
