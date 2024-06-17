# src/tabs/ui_calculo.R

ui_calculo <- fluidPage(
  useShinyFeedback(),
  fluidRow(
    box(
      title = "Parámetros del Muestreo",
      status = "primary",
      solidHeader = TRUE,
      width = 12,
      selectInput("sampling_method", "Tipo de Muestreo",
                  choices = list("Seleccione un tipo de muestreo" = "",
                                 "Muestreo Aleatorio Simple (M.A.S)" = "MAS",
                                 "Muestreo Aleatorio con Reposición (M.A.C.R)" = "MACR")),
      conditionalPanel(
        condition = "input.sampling_method == 'MAS'",
        numericInput("population_size", "Tamaño de la Población", value = 1000, min = 1)
      ),
      conditionalPanel(
        condition = "input.sampling_method != ''",
        selectInput("parameter_of_interest", "Parámetro de Interés",
                    choices = list("Seleccione un parametro de interés" = "",
                                   "Media Poblacional" = "media",
                                   "Proporción Poblacional" = "proporcion"))
      ),
      conditionalPanel(
        condition = "input.parameter_of_interest == 'media'",
        numericInput("var", "Varianza Poblacional", value = 1, min = 0, step = 0.1)
      ),
      conditionalPanel(
        condition = "input.parameter_of_interest == 'proporcion'",
        numericInput("proportion_estimate", "Estimación Conocida de la Proporción", value = 0.5, min = 0, max = 1, step = 0.01)
      ),
      conditionalPanel(
        condition = "input.parameter_of_interest != ''",
        selectInput("estimation_precision", "Precisión de la Estimación",
                    choices = list("Seleccione una opción de error" = "",
                                   "Error de Muestreo" = "error_muestreo",
                                   "Error Máximo Admisible con Coeficiente de Confianza Fijado" = "error_max_admisible"))
      ),
      conditionalPanel(
        condition = "input.estimation_precision == 'error_muestreo'",
        numericInput("sampling_error", "Error de Muestreo", value = 0.05, min = 0, step = 0.01),
        bsTooltip("sampling_error", "The wait times will be broken into this many equally spaced bins",
                  "left", options = NULL)
      ),
      conditionalPanel(
        condition = "input.estimation_precision == 'error_max_admisible'",
        numericInput("max_error", "Error Máximo Admisible", value = 0.05, min = 0, step = 0.01),
        numericInput("confidence_level", "Nivel de Confianza", value = 0.95, min = 0, max = 1, step = 0.01)
      ),
      div(style = "text-align: right;",
          actionButton("calculate", "Calcular")
      )
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
