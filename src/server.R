# server.R

server <- function(input, output, session) {
  result <- eventReactive(input$calculate, {
    validate(
      need(input$sampling_method, "Selecciona un tipo de muestreo."),
      need(input$parameter_of_interest, "Selecciona un parámetro de interés."),
      need(input$estimation_precision, "Selecciona una precisión de la estimación.")
    )
    
    N <- if (input$sampling_method == "MAS") input$population_size else NULL
    
    if (input$parameter_of_interest == "media") {
      validate(
        need(input$var > 0, "La varianza poblacional (Var) debe ser mayor que 0.")
      )
      if (input$estimation_precision == "error_muestreo") {
        validate(
          need(input$sampling_error > 0, "El error de muestreo debe ser mayor que 0.")
        )
        n <- calcular_tamano_muestreo_media(input$sampling_method, N, input$var, input$sampling_error)
      } else if (input$estimation_precision == "error_max_admisible") {
        validate(
          need(input$max_error > 0, "El error máximo admisible debe ser mayor que 0."),
          need(input$confidence_level > 0 & input$confidence_level < 1, "El nivel de confianza debe estar entre 0 y 1.")
        )
        n <- calcular_tamano_muestreo_media(input$sampling_method, N, input$var, input$max_error, input$confidence_level, input$approx_normal, input$tchebychev_des)
      }
    } else if (input$parameter_of_interest == "proporcion") {
      validate(
        need(input$proportion_estimate >= 0 & input$proportion_estimate <= 1, "La estimación de la proporción debe estar entre 0 y 1.")
      )
      if (input$estimation_precision == "error_muestreo") {
        validate(
          need(input$sampling_error > 0, "El error de muestreo debe ser mayor que 0.")
        )
        n <- calcular_tamano_muestreo_proporcion(input$sampling_method, N, input$proportion_estimate, input$sampling_error)
      } else if (input$estimation_precision == "error_max_admisible") {
        validate(
          need(input$max_error > 0, "El error máximo admisible debe ser mayor que 0."),
          need(input$confidence_level > 0 & input$confidence_level < 1, "El nivel de confianza debe estar entre 0 y 1.")
        )
        n <- calcular_tamano_muestreo_proporcion(input$sampling_method, N, input$proportion_estimate, input$max_error, input$confidence_level, input$approx_normal, input$tchebychev_des)
      }
    }
    return(n)
  })
  
  output$show_result <- reactive({
    !is.null(result())
  })
  
  outputOptions(output, "show_result", suspendWhenHidden = FALSE)
  
  output$result <- renderPrint({
    res <- result()
    if (!is.null(res)) {
      paste("El tamaño muestral requerido es:", res)
    }
  })
}
