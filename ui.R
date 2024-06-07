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
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Cálculo", tabName = "calculo", icon = icon("calculator")),
      menuItem("Ayuda", tabName = "ayuda", icon = icon("info-circle")),
      menuItem("Acerca de", tabName = "acerca_de", icon = icon("info"))
    )
  ),
  dashboardBody(
    useShinyjs(),
    tabItems(
      tabItem(tabName = "home",
              fluidRow(
                box(
                  title = "Bienvenido",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12,
                  img(src = "tu_foto.jpg", height = "400px"),  # Asegúrate de tener la foto en el directorio www
                  h2("Nombre de la Aplicación"),
                  p("Descripción breve del proyecto.")
                )
              )
      ),
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
                  verbatimTextOutput("result")
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
      ),
      tabItem(tabName = "acerca_de",
              fluidRow(
                box(
                  title = "Acerca de",
                  status = "info",
                  solidHeader = TRUE,
                  width = 12,
                  h3("Nombre del Proyecto:"),
                  p("Cálculo del Tamaño Muestral"),
                  h3("Versión:"),
                  p("1.0.0"),
                  h3("Desarrollador:"),
                  p("Tu Nombre"),
                  h3("Licencia:"),
                  p("Este proyecto está bajo la Licencia MIT. Para más detalles, consulte el archivo LICENSE."),
                  h3("Descripción:"),
                  p("Esta aplicación calcula el tamaño muestral necesario para diferentes tipos de estudios, incluyendo estimación de medias y proporciones, así como la diferencia entre dos medias. Proporciona una interfaz fácil de usar para investigadores y estudiantes.")
                )
              )
      )
    )
  )
)
