#ui.R
#----------

library(shiny)
library(shinythemes)
library(shinyjs)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Cálculo del Tamaño Muestral"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Cálculo", tabName = "calculo", icon = icon("calculator")),
      menuItem("Ayuda", tabName = "ayuda", icon = icon("info-circle"))
    )
  ),
  dashboardBody(
    useShinyjs(),
    tabItems(
      tabItem(tabName = "calculo",
              fluidRow(
                box(
                  title = "Parámetros del Muestreo",
                  status = "primary",
                  solidHeader = TRUE,
                  collapsible = TRUE,
                  width = 4,
                  selectInput("sampling_type", "Tipo de Muestreo",
                              choices = list("Simple sin Reposición" = "sin_reposicion",
                                             "Simple con Reposición" = "con_reposicion")),
                  conditionalPanel(
                    condition = "input.sampling_type == 'sin_reposicion'",
                    numericInput("sd", "Desviación Estándar (sd)", value = 1),
                    numericInput("conf_level", "Nivel de Confianza (conf_level)", value = 0.95, step = 0.01),
                    numericInput("margin_error", "Margen de Error (margin_error)", value = 0.05, step = 0.01)
                  ),
                  conditionalPanel(
                    condition = "input.sampling_type == 'con_reposicion'",
                    numericInput("p", "Proporción (p)", value = 0.5, step = 0.01),
                    numericInput("conf_level_repos", "Nivel de Confianza (conf_level)", value = 0.95, step = 0.01),
                    numericInput("margin_error_repos", "Margen de Error (margin_error)", value = 0.05, step = 0.01)
                  ),
                  actionButton("calculate", "Calcular"),
                ),
                box(
                  title = "Resultado",
                  status = "primary",
                  solidHeader = TRUE,
                  collapsible = TRUE,
                  width = 8,
                  verbatimTextOutput("result"),
                  plotOutput("samplePlot")
                )
              )
      ),
      tabItem(tabName = "ayuda",
              fluidRow(
                box(
                  title = "Información sobre el Tamaño Muestral",
                  status = "info",
                  solidHeader = TRUE,
                  width = 12,
                  withMathJax(help_content)
                )
              )
      )
    )
  )
)
