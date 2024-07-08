# src/server.R

server <- function(input, output, session) {
  result <- reactiveVal(NULL)
  
  # Observa cambios en los inputs y muestra feedback en tiempo real
  observe({
    if (is.null(input$sampling_method)) {
      showFeedbackDanger("sampling_method", "Seleccione un tipo de muestreo.")
    } else {
      hideFeedback("sampling_method")
    }
  })
  
  observe({
    if (input$sampling_method == "MAS") {
      if (is.na(input$population_size) || input$population_size <= 0) {
        showFeedbackDanger("population_size",
                           "El tamaño de la población deber ser un número mayor que 0.")
      } else {
        hideFeedback("population_size")
      }
    } else {
      hideFeedback("population_size")
    }
  })
  
  observe({
    if (is.null(input$parameter_of_interest)) {
      showFeedbackDanger("parameter_of_interest",
                         "Seleccione un parámetro de interés.")
    } else {
      hideFeedback("parameter_of_interest")
    }
  })
  
  observe({
    if (input$parameter_of_interest == "media") {
      if (is.na(input$var) || input$var <= 0) {
        showFeedbackDanger("var",
                           "La varianza poblacional deber ser un número mayor que 0.")
      } else {
        hideFeedback("var")
      }
    } else {
      hideFeedback("var")
    }
  })
  
  observe({
    if (input$parameter_of_interest == "proporcion") {
      if (is.na(input$proportion_estimate) ||
          input$proportion_estimate < 0 ||
          input$proportion_estimate > 1) {
        showFeedbackDanger(
          "proportion_estimate",
          "La estimación de la proporción debe ser un número entre 0 y 1."
        )
      } else {
        hideFeedback("proportion_estimate")
      }
    } else {
      hideFeedback("proportion_estimate")
    }
  })
  
  observe({
    if (is.null(input$estimation_precision)) {
      showFeedbackDanger("estimation_precision",
                         "Seleccione una precisión de la estimación.")
    } else {
      hideFeedback("estimation_precision")
    }
  })
  
  observe({
    if (input$estimation_precision == "error_muestreo") {
      if (is.na(input$sampling_error) || input$sampling_error <= 0) {
        showFeedbackDanger("sampling_error",
                           "El error de muestreo deber ser un número mayor que 0.")
      } else {
        hideFeedback("sampling_error")
      }
    } else {
      hideFeedback("sampling_error")
    }
  })
  
  observe({
    if (input$estimation_precision == "error_max_admisible") {
      if (is.na(input$max_error) || input$max_error <= 0) {
        showFeedbackDanger("max_error",
                           "El error máximo admisible deber ser un número mayor que 0.")
      } else {
        hideFeedback("max_error")
      }
      if (is.na(input$confidence_level) ||
          input$confidence_level <= 0 ||
          input$confidence_level >= 1) {
        showFeedbackDanger("confidence_level",
                           "El nivel de confianza debe ser un número entre 0 y 1.")
      } else {
        hideFeedback("confidence_level")
      }
    } else {
      hideFeedback("max_error")
      hideFeedback("confidence_level")
    }
  })
  
  observeEvent(input$calculate, {
    # Resetear feedback
    hideFeedback("sampling_method")
    hideFeedback("population_size")
    hideFeedback("parameter_of_interest")
    hideFeedback("var")
    hideFeedback("proportion_estimate")
    hideFeedback("estimation_precision")
    hideFeedback("sampling_error")
    hideFeedback("max_error")
    hideFeedback("confidence_level")
    
    # Validaciones
    valid <- TRUE
    
    if (is.null(input$sampling_method) ||
        input$sampling_method == "") {
      showFeedbackDanger("sampling_method", "Seleccione un tipo de muestreo.")
      valid <- FALSE
    }
    
    if (input$sampling_method == "MAS" &&
        (is.na(input$population_size) ||
         input$population_size <= 0)) {
      showFeedbackDanger("population_size",
                         "El tamaño de la población deber ser un número mayor que 0.")
      valid <- FALSE
    }
    
    if (is.null(input$parameter_of_interest) ||
        input$parameter_of_interest == "") {
      showFeedbackDanger("parameter_of_interest",
                         "Seleccione un parámetro de interés.")
      valid <- FALSE
    }
    
    if (input$parameter_of_interest == "media" &&
        (is.na(input$var) || input$var <= 0)) {
      showFeedbackDanger("var",
                         "La varianza poblacional deber ser un número mayor que 0.")
      valid <- FALSE
    }
    
    if (input$parameter_of_interest == "proporcion" &&
        (
          is.na(input$proportion_estimate) ||
          input$proportion_estimate < 0 ||
          input$proportion_estimate > 1
        )) {
      showFeedbackDanger(
        "proportion_estimate",
        "La estimación de la proporción debe ser un número entre 0 y 1."
      )
      valid <- FALSE
    }
    
    if (is.null(input$estimation_precision) ||
        input$estimation_precision == "") {
      showFeedbackDanger("estimation_precision",
                         "Seleccione una precisión de la estimación.")
      valid <- FALSE
    }
    
    if (input$estimation_precision == "error_muestreo" &&
        (is.na(input$sampling_error) ||
         input$sampling_error <= 0)) {
      showFeedbackDanger("sampling_error",
                         "El error de muestreo deber ser un número mayor que 0.")
      valid <- FALSE
    }
    
    if (input$estimation_precision == "error_max_admisible") {
      if (is.na(input$max_error) || input$max_error <= 0) {
        showFeedbackDanger("max_error",
                           "El error máximo admisible deber ser un número mayor que 0.")
        valid <- FALSE
      }
      if (is.na(input$confidence_level) ||
          input$confidence_level <= 0 ||
          input$confidence_level >= 1) {
        showFeedbackDanger("confidence_level",
                           "El nivel de confianza debe ser un número entre 0 y 1.")
        valid <- FALSE
      }
    }
    
    if (valid) {
      N <-
        if (input$sampling_method == "MAS")
          input$population_size
      else
        NULL
      
      if (input$parameter_of_interest == "media") {
        if (input$estimation_precision == "error_muestreo") {
          n <-
            calcular_tamano_muestral_media(input$sampling_method,
                                           N,
                                           input$var,
                                           input$sampling_error)
        } else if (input$estimation_precision == "error_max_admisible") {
          n <-
            calcular_tamano_muestral_media(
              input$sampling_method,
              N,
              input$var,
              input$max_error,
              input$confidence_level
            )
        }
      } else if (input$parameter_of_interest == "proporcion") {
        if (input$estimation_precision == "error_muestreo") {
          n <-
            calcular_tamano_muestral_proporcion(
              input$sampling_method,
              N,
              input$proportion_estimate,
              input$sampling_error
            )
        } else if (input$estimation_precision == "error_max_admisible") {
          n <-
            calcular_tamano_muestral_proporcion(
              input$sampling_method,
              N,
              input$proportion_estimate,
              input$max_error,
              input$confidence_level
            )
        }
      }
      # Crear el texto de resumen elaborado
      resultado <-
        paste0(
          "<div style='font-size: 24px; font-weight: bold; text-align: center;'>",
          "El tamaño muestral mínimo requerido es:</div>",
          "<div style='font-size: 40px; font-weight: bold; text-align: center;'>",
          n,
          "</div>"
        )
      
      part1 <- paste(
        "Se ha calculado el tamaño muestral",
        "teniendo en cuenta que se quiere utilizar un muestreo"
      )
      if (input$sampling_method == "MAS") {
        part2 <- "aleatorio simple (M.A.S.)"
        part6 <-
          paste("El tamaño de la población es de", N, "individios.")
      } else {
        part2 <- "aleatorio con reposición (M.A.C.R.)"
        part6 <- NULL
      }
      part3 <- "y el parámetro de interés es la"
      if (input$parameter_of_interest == "media") {
        part4 <- "media"
        part7 <-
          paste("La varianza poblacional utilizada es", input$var)
      } else {
        part4 <- "proporción"
        part7 <- paste("La estimación conocida de la proporción es",
                       input$proportion_estimate)
      }
      part5 <- "poblacional."
      part8 <-
        "y la precisión de la estimación está determinada por"
      if (input$estimation_precision == "error_muestreo") {
        part9 <- paste("el error de muestreo, cuyo valor es",
                       input$sampling_error,
                       ".")
      } else {
        part9 <-
          paste0(
            "el error máximo admisible con un nivel de confianza",
            " fijado, cuyos valores son ",
            input$max_error,
            " y ",
            input$confidence_level * 100,
            "%, respectivamente."
          )
      }
      resumen <- paste(part1,
                       part2,
                       part3,
                       part4,
                       part5,
                       part6,
                       part7,
                       part8,
                       part9)
      
      result(HTML(paste0(resultado, "<br>", resumen)))
    } else {
      result(HTML("Corrija los errores antes de continuar."))
    }
  })
  
  output$result <- renderUI({
    result()
  })
  
  output$show_result <- reactive({
    !is.null(result())
  })
  
  outputOptions(output, "show_result", suspendWhenHidden = FALSE)
}
