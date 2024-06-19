# src/tabs/ui_calculo.R

ui_calculo <- fluidPage(
  useShinyFeedback(),
  fluidRow(
    box(
      title = "Parámetros del Muestreo",
      status = "primary",
      solidHeader = TRUE,
      width = 12,
      selectInput("sampling_method", 
                  label = tags$span("Tipo de Muestreo", 
                                    tags$i(id = "sampling_method_help", class = "fas fa-question-circle")),
                  choices = list("Seleccione un tipo de muestreo" = "",
                                 "Muestreo Aleatorio Simple (M.A.S)" = "MAS",
                                 "Muestreo Aleatorio con Reposición (M.A.C.R)" = "MACR")
      ),
      
      conditionalPanel(
        condition = "input.sampling_method == 'MAS'",
        numericInput("population_size", 
                     label = tags$span("Tamaño de la Población", 
                                       tags$i(id = "population_size_help", class = "fas fa-question-circle")),
                     value = 1000, min = 1)
      ),
      
      selectInput("parameter_of_interest", 
                  label = tags$span("Parámetro de Interés", 
                                    tags$i(id = "parameter_of_interest_help", class = "fas fa-question-circle")),
                  choices = list("Seleccione un parametro de interés" = "",
                                 "Media Poblacional" = "media",
                                 "Proporción Poblacional" = "proporcion")
      ),

      conditionalPanel(
        condition = "input.parameter_of_interest == 'media'",
        numericInput("var", 
                     label = tags$span("Varianza Poblacional", 
                                       tags$i(id = "var_help", class = "fas fa-question-circle")),
                     value = 1, min = 0, step = 0.1)
      ),
      
      conditionalPanel(
        condition = "input.parameter_of_interest == 'proporcion'",
        numericInput("proportion_estimate", 
                     label = tags$span("Estimación Conocida de la Proporción", 
                                       tags$i(id = "proportion_estimate_help", class = "fas fa-question-circle")),
                     value = 0.5, min = 0, max = 1, step = 0.01)
      ),

      selectInput("estimation_precision", 
                  label = tags$span("Precisión de la Estimación", 
                                    tags$i(id = "estimation_precision_help", class = "fas fa-question-circle")),
                  choices = list("Seleccione una opción de error" = "",
                                 "Error de Muestreo" = "error_muestreo",
                                 "Error Máximo Admisible con Coeficiente de Confianza Fijado" = "error_max_admisible")
      ),
      
      conditionalPanel(
        condition = "input.estimation_precision == 'error_muestreo'",
        numericInput("sampling_error", 
                     label = tags$span("Error de Muestreo", 
                                       tags$i(id = "sampling_error_help", class = "fas fa-question-circle")),
                     value = 0.05, min = 0, step = 0.01)
      ),
      
      conditionalPanel(
        condition = "input.estimation_precision == 'error_max_admisible'",
        numericInput("max_error", 
                     label = tags$span("Error Máximo Admisible", 
                                       tags$i(id = "max_error_help", class = "fas fa-question-circle")),
                     value = 0.05, min = 0, step = 0.01),
        numericInput("confidence_level", 
                     label = tags$span("Nivel de Confianza", 
                                       tags$i(id = "confidence_level_help", class = "fas fa-question-circle")),
                     value = 0.95, min = 0, max = 1, step = 0.01)
      ),
      
      # Tooltips
      bsTooltip("sampling_method_help", "Seleccione el tipo de muestreo a utilizar.", "right", options = list(container = "body")),
      bsTooltip("population_size_help", "Ingrese el tamaño total de la población.", "right", options = list(container = "body")),
      bsTooltip("parameter_of_interest_help", "Seleccione el parámetro de interés.", "right", options = list(container = "body")),
      bsTooltip("var_help", "Ingrese la varianza poblacional estimada.", "right", options = list(container = "body")),
      bsTooltip("proportion_estimate_help", "Ingrese la estimación conocida de la proporción poblacional.", "right", options = list(container = "body")),
      bsTooltip("estimation_precision_help", "Seleccione el tipo de precisión para la estimación.", "right", options = list(container = "body")),
      bsTooltip("sampling_error_help", "Ingrese el error de muestreo permitido.", "right", options = list(container = "body")),
      bsTooltip("max_error_help", "Ingrese el error máximo admisible.", "right", options = list(container = "body")),
      bsTooltip("confidence_level_help", "Ingrese el nivel de confianza deseado.", "right", options = list(container = "body")),
      
      actionButton("calculate", "Calcular", style = "float: right;")
    )
  ),
  fluidRow(
    conditionalPanel(
      condition = "output.show_result",
      box(
        title = "Resultado",
        status = "primary",
        solidHeader = TRUE,
        width = 12,
        uiOutput("result")
      )
    )
  )
)
