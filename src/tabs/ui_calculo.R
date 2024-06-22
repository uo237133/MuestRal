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
      bsTooltip("sampling_method_help", "El tipo de muestreo define la forma en que los individuos son seleccionados para la muestra. El muestreo aleatorio simple (M.A.S) selecciona individuos sin reposición, mientras que el muestreo aleatorio con reposición (M.A.C.R) permite que un individuo pueda ser seleccionado más de una vez.", "right", options = list(container = "body")),
      bsTooltip("population_size_help", "El tamaño de la población es el número total de individuos en la población de estudio. Debe ser un número mayor que 0.", "right", options = list(container = "body")),
      bsTooltip("parameter_of_interest_help", "El parámetro de interés es la característica de la población que se desea estimar a partir de la muestra. Puede ser la media poblacional, que es el promedio de los valores, o la proporción poblacional, que es la fracción de individuos con una característica específica.", "right", options = list(container = "body")),
      bsTooltip("var_help", "La varianza es una medida de dispersión que representa la variabilidad de una serie de datos con respecto a su media. Debe ser un número mayor que 0.", "right", options = list(container = "body")),
      bsTooltip("proportion_estimate_help", "La proporción es la fracción de individuos en la población que tienen una característica específica. Debe estar entre 0 y 1.", "right", options = list(container = "body")),
      bsTooltip("estimation_precision_help", "La precisión de la estimación determina el grado de exactitud deseado en el resultado. Puede ser definida mediante el error de muestreo, que es la diferencia tolerada entre el valor estimado y el verdadero valor poblacional, o mediante el error máximo admisible con un nivel de confianza específico, que establece el rango dentro del cual se espera que caiga el verdadero valor poblacional con una cierta probabilidad.", "right", options = list(container = "body")),
      bsTooltip("sampling_error_help", "El error de muestreo es la diferencia entre el valor estimado a partir de la muestra y el valor real de la población. Debe ser un número mayor que 0.", "right", options = list(container = "body")),
      bsTooltip("max_error_help", "El error máximo admisible es el mayor margen de error que se puede tolerar para los resultados de la muestra. Debe ser un número mayor que 0.", "right", options = list(container = "body")),
      bsTooltip("confidence_level_help", "El nivel de confianza es la probabilidad de que el intervalo de confianza contenga el valor verdadero del parámetro de población. Debe estar entre 0 y 1.", "right", options = list(container = "body")),
      
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
