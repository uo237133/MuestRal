# src/tabs/ui_calculo.R

ui_calculo <- fluidPage(useShinyFeedback(),
                        fluidRow(
                          box(
                            title = "Parámetros del Muestreo",
                            status = "primary",
                            solidHeader = TRUE,
                            width = 12,
                            selectInput(
                              "sampling_method",
                              label = tags$span(
                                "Tipo de Muestreo",
                                tags$em(id = "sampling_method_help", class = "fas fa-question-circle")
                              ),
                              choices = list(
                                "Seleccione un tipo de muestreo" = "",
                                "Muestreo Aleatorio Simple (M.A.S.)" = "MAS",
                                "Muestreo Aleatorio con Reposición (M.A.C.R.)" = "MACR"
                              )
                            ),
                            
                            conditionalPanel(
                              condition = "input.sampling_method == 'MAS'",
                              numericInput(
                                "population_size",
                                label = tags$span(
                                  "Tamaño de la Población",
                                  tags$em(id = "population_size_help", class = "fas fa-question-circle")
                                ),
                                value = 1000,
                                min = 1
                              )
                            ),
                            
                            selectInput(
                              "parameter_of_interest",
                              label = tags$span(
                                "Parámetro de Interés",
                                tags$em(id = "parameter_of_interest_help", class = "fas fa-question-circle")
                              ),
                              choices = list(
                                "Seleccione un parametro de interés" = "",
                                "Media Poblacional" = "media",
                                "Proporción Poblacional" = "proporcion"
                              )
                            ),
                            
                            conditionalPanel(
                              condition = "input.parameter_of_interest == 'media'",
                              numericInput(
                                "var",
                                label = tags$span(
                                  "Varianza Poblacional",
                                  tags$em(id = "var_help", class = "fas fa-question-circle")
                                ),
                                value = 1,
                                min = 0,
                                step = 0.1
                              )
                            ),
                            
                            conditionalPanel(
                              condition = "input.parameter_of_interest == 'proporcion'",
                              numericInput(
                                "proportion_estimate",
                                label = tags$span(
                                  "Estimación Conocida de la Proporción",
                                  tags$em(id = "proportion_estimate_help", class = "fas fa-question-circle")
                                ),
                                value = 0.5,
                                min = 0,
                                max = 1,
                                step = 0.01
                              )
                            ),
                            
                            selectInput(
                              "estimation_precision",
                              label = tags$span(
                                "Precisión de la Estimación",
                                tags$em(id = "estimation_precision_help", class = "fas fa-question-circle")
                              ),
                              choices = list(
                                "Seleccione una opción de error" = "",
                                "Error de Muestreo" = "error_muestreo",
                                "Error Máximo Admisible con Coeficiente de Confianza Fijado" = "error_max_admisible"
                              )
                            ),
                            
                            conditionalPanel(
                              condition = "input.estimation_precision == 'error_muestreo'",
                              numericInput(
                                "sampling_error",
                                label = tags$span(
                                  "Error de Muestreo",
                                  tags$em(id = "sampling_error_help", class = "fas fa-question-circle")
                                ),
                                value = 0.05,
                                min = 0,
                                step = 0.01
                              )
                            ),
                            
                            conditionalPanel(
                              condition = "input.estimation_precision == 'error_max_admisible'",
                              numericInput(
                                "max_error",
                                label = tags$span(
                                  "Error Máximo Admisible",
                                  tags$em(id = "max_error_help", class = "fas fa-question-circle")
                                ),
                                value = 0.05,
                                min = 0,
                                step = 0.01
                              ),
                              numericInput(
                                "confidence_level",
                                label = tags$span(
                                  "Nivel de Confianza",
                                  tags$em(id = "confidence_level_help", class = "fas fa-question-circle")
                                ),
                                value = 0.95,
                                min = 0,
                                max = 1,
                                step = 0.01
                              )
                            ),
                            
                            # Tooltips
                            bsTooltip(
                              "sampling_method_help",
                              "El tipo de muestreo define la forma en la que los individuos de la población son seleccionados para la muestra. En el muestreo aleatorio simple (M.A.S.) los individuos se seleccionan al azar y con reemplazamiento, mientras que en el muestreo aleatorio con repetición (M.A.C.R.), un individuo puede ser seleccionado más de una vez.",
                              "right",
                              options = list(container = "body")
                            ),
                            bsTooltip(
                              "population_size_help",
                              "El tamaño de la población es el número total de individuos en la población de estudio. Debe ser un número mayor que 0.",
                              "right",
                              options = list(container = "body")
                            ),
                            bsTooltip(
                              "parameter_of_interest_help",
                              "El parámetro de interés es la característica de la población que se desea estimar a partir de la muestra. Puede ser la media poblacional, que es el promedio de los valores, o la proporción poblacional, que es la fracción de individuos con una característica específica.",
                              "right",
                              options = list(container = "body")
                            ),
                            bsTooltip(
                              "var_help",
                              "Para calcular el tamaño muestral necesario para estimar la media poblacional se necesita conocer la varianza poblacional, esto es, la dispersión de los datos con respecto a su media. Debe ser un número mayor que 0.",
                              "right",
                              options = list(container = "body")
                            ),
                            bsTooltip(
                              "proportion_estimate_help",
                              "Para calcular el tamaño muestral necesario para estimar la proporción poblacional se necesita conocer previamente una estimación de dicha proporción. Debe ser un número entre 0 y 1. Si se desconoce completamente el valor de la proporción, se toma 0.5.",
                              "right",
                              options = list(container = "body")
                            ),
                            bsTooltip(
                              "estimation_precision_help",
                              "La precisión de la estimación determina el grado de exactitud deseado en el resultado. En términos absolutos, queda determinada mediante del error de muestreo o el error máximo admisible con un coeficiente de confianza fijado.",
                              "right",
                              options = list(container = "body")
                            ),
                            bsTooltip(
                              "sampling_error_help",
                              "El error de muestreo es la raíz cuadrada de la varianza del estimador.",
                              "right",
                              options = list(container = "body")
                            ),
                            bsTooltip(
                              "max_error_help",
                              "El error máximo admisible es la máxima diferencia (en valor absoluto) entre la estimación y el valor verdadero del parámetro poblacional que se está dispuesto a asumir. Debe ser un número mayor que 0.",
                              "right",
                              options = list(container = "body")
                            ),
                            bsTooltip(
                              "confidence_level_help",
                              "El nivel de confianza es la probabilidad de que el intervalo de confianza contenga el valor verdadero del parámetro de población. Debe ser un número entre 0 y 1.",
                              "right",
                              options = list(container = "body")
                            ),
                            
                            actionButton("calculate", "Calcular", style = "float: right;")
                          )
                        ),
                        fluidRow(conditionalPanel(
                          condition = "output.show_result",
                          box(
                            title = "Resultado",
                            status = "primary",
                            solidHeader = TRUE,
                            width = 12,
                            uiOutput("result")
                          )
                        )))
