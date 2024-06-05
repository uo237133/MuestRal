# ui.R

library(shiny)
library(shinythemes)
library(shinyjs)
library(shinydashboard)

source("help_text.R")

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
                              choices = list("Media" = "media",
                                             "Proporción con Reposición" = "proporcion_reposicion",
                                             "Proporción con Población Finita" = "proporcion_poblacion_finita",
                                             "Diferencia entre Medias" = "diferencia_medias")),
                  conditionalPanel(
                    condition = "input.sampling_type == 'media'",
                    numericInput("sd", "Desviación Estándar (sd)", value = 1),
                    numericInput("conf_level", "Nivel de Confianza (conf_level)", value = 0.95, step = 0.01),
                    numericInput("margin_error", "Margen de Error (margin_error)", value = 0.05, step = 0.01)
                  ),
                  conditionalPanel(
                    condition = "input.sampling_type == 'proporcion_reposicion'",
                    numericInput("p", "Proporción (p)", value = 0.5, step = 0.01),
                    numericInput("conf_level_repos", "Nivel de Confianza (conf_level)", value = 0.95, step = 0.01),
                    numericInput("margin_error_repos", "Margen de Error (margin_error)", value = 0.05, step = 0.01)
                  ),
                  conditionalPanel(
                    condition = "input.sampling_type == 'proporcion_poblacion_finita'",
                    numericInput("N", "Tamaño de la Población (N)", value = 100),
                    numericInput("p", "Proporción (p)", value = 0.5, step = 0.01),
                    numericInput("conf_level_repos", "Nivel de Confianza (conf_level)", value = 0.95, step = 0.01),
                    numericInput("margin_error_repos", "Margen de Error (margin_error)", value = 0.05, step = 0.01)
                  ),
                  conditionalPanel(
                    condition = "input.sampling_type == 'diferencia_medias'",
                    numericInput("sd1", "Desviación Estándar Población 1 (sd1)", value = 1),
                    numericInput("sd2", "Desviación Estándar Población 2 (sd2)", value = 1),
                    numericInput("conf_level", "Nivel de Confianza (conf_level)", value = 0.95, step = 0.01),
                    numericInput("margin_error", "Margen de Error (margin_error)", value = 0.05, step = 0.01)
                  ),
                  actionButton("calculate", "Calcular")
                ),
                box(
                  title = "Resultado",
                  status = "primary",
                  solidHeader = TRUE,
                  collapsible = TRUE,
                  width = 8,
                  verbatimTextOutput("result"),
                  plotOutput("samplePlot"),
                  textOutput("plotDescription")
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
