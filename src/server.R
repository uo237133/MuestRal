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
        showFeedbackDanger("population_size", "El tamaño de la población debe ser mayor que 0.")
      } else {
        hideFeedback("population_size")
      }
    } else {
      hideFeedback("population_size")
    }
  })
  
  observe({
    if (is.null(input$parameter_of_interest)) {
      showFeedbackDanger("parameter_of_interest", "Seleccione un parámetro de interés.")
    } else {
      hideFeedback("parameter_of_interest")
    }
  })
  
  observe({
    if (input$parameter_of_interest == "media") {
      if (is.na(input$var) || input$var <= 0) {
        showFeedbackDanger("var", "La varianza poblacional debe ser mayor que 0.")
      } else {
        hideFeedback("var")
      }
    } else {
      hideFeedback("var")
    }
  })
  
  observe({
    if (input$parameter_of_interest == "proporcion") {
      if (is.na(input$proportion_estimate) || input$proportion_estimate < 0 || input$proportion_estimate > 1) {
        showFeedbackDanger("proportion_estimate", "La estimación de la proporción debe estar entre 0 y 1.")
      } else {
        hideFeedback("proportion_estimate")
      }
    } else {
      hideFeedback("proportion_estimate")
    }
  })
  
  observe({
    if (is.null(input$estimation_precision)) {
      showFeedbackDanger("estimation_precision", "Seleccione una precisión de la estimación.")
    } else {
      hideFeedback("estimation_precision")
    }
  })
  
  observe({
    if (input$estimation_precision == "error_muestreo") {
      if (is.na(input$sampling_error) || input$sampling_error <= 0) {
        showFeedbackDanger("sampling_error", "El error de muestreo debe ser mayor que 0.")
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
        showFeedbackDanger("max_error", "El error máximo admisible debe ser mayor que 0.")
      } else {
        hideFeedback("max_error")
      }
      if (is.na(input$confidence_level) || input$confidence_level <= 0 || input$confidence_level >= 1) {
        showFeedbackDanger("confidence_level", "El nivel de confianza debe estar entre 0 y 1.")
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
    
    if (is.null(input$sampling_method) || input$sampling_method == "") {
      showFeedbackDanger("sampling_method", "Seleccione un tipo de muestreo.")
      valid <- FALSE
    }
    
    if (input$sampling_method == "MAS" && (is.na(input$population_size) || input$population_size <= 0)) {
      showFeedbackDanger("population_size", "El tamaño de la población debe ser mayor que 0.")
      valid <- FALSE
    }
    
    if (is.null(input$parameter_of_interest) || input$parameter_of_interest == "") {
      showFeedbackDanger("parameter_of_interest", "Seleccione un parámetro de interés.")
      valid <- FALSE
    }
    
    if (input$parameter_of_interest == "media" && (is.na(input$var) || input$var <= 0)) {
      showFeedbackDanger("var", "La varianza poblacional debe ser mayor que 0.")
      valid <- FALSE
    }
    
    if (input$parameter_of_interest == "proporcion" && (is.na(input$proportion_estimate) || input$proportion_estimate < 0 || input$proportion_estimate > 1)) {
      showFeedbackDanger("proportion_estimate", "La estimación de la proporción debe estar entre 0 y 1.")
      valid <- FALSE
    }
    
    if (is.null(input$estimation_precision) || input$estimation_precision == "") {
      showFeedbackDanger("estimation_precision", "Seleccione una precisión de la estimación.")
      valid <- FALSE
    }
    
    if (input$estimation_precision == "error_muestreo" && (is.na(input$sampling_error) || input$sampling_error <= 0)) {
      showFeedbackDanger("sampling_error", "El error de muestreo debe ser mayor que 0.")
      valid <- FALSE
    }
    
    if (input$estimation_precision == "error_max_admisible") {
      if (is.na(input$max_error) || input$max_error <= 0) {
        showFeedbackDanger("max_error", "El error máximo admisible debe ser mayor que 0.")
        valid <- FALSE
      }
      if (is.na(input$confidence_level) || input$confidence_level <= 0 || input$confidence_level >= 1) {
        showFeedbackDanger("confidence_level", "El nivel de confianza debe estar entre 0 y 1.")
        valid <- FALSE
      }
    }
    
    if (valid) {
      N <- if (input$sampling_method == "MAS") input$population_size else NULL
      
      if (input$parameter_of_interest == "media") {
        if (input$estimation_precision == "error_muestreo") {
          n <- calcular_tamano_muestral_media(input$sampling_method, N, input$var, input$sampling_error)
        } else if (input$estimation_precision == "error_max_admisible") {
          n <- calcular_tamano_muestral_media(input$sampling_method, N, input$var, input$max_error, input$confidence_level)
        }
      } else if (input$parameter_of_interest == "proporcion") {
        if (input$estimation_precision == "error_muestreo") {
          n <- calcular_tamano_muestral_proporcion(input$sampling_method, N, input$proportion_estimate, input$sampling_error)
        } else if (input$estimation_precision == "error_max_admisible") {
          n <- calcular_tamano_muestral_proporcion(input$sampling_method, N, input$proportion_estimate, input$max_error, input$confidence_level)
        }
      }
      # Crear el texto de resumen elaborado
      resumen <- "Se ha seleccionado el tipo de muestreo "
      resumen <- paste0(resumen, ifelse(input$sampling_method == "MAS", "Muestreo Aleatorio Simple (M.A.S)", "Muestreo Aleatorio con Reposición (M.A.C.R)"), ".<br/>")
      if (!is.null(N)) {
        resumen <- paste0(resumen, "El tamaño de la población considerado es de ", N, " individuos.<br/>")
      }
      resumen <- paste0(resumen, "El parámetro de interés es la ", ifelse(input$parameter_of_interest == "media", "media poblacional", "proporción poblacional"), ".<br/>")
      if (input$parameter_of_interest == "media") {
        resumen <- paste0(resumen, "La varianza poblacional utilizada es de ", input$var, ".<br/>")
      } else {
        resumen <- paste0(resumen, "La estimación conocida de la proporción es de ", input$proportion_estimate, ".<br/>")
      }
      resumen <- paste0(resumen, "La precisión de la estimación está determinada por ", ifelse(input$estimation_precision == "error_muestreo", "el error de muestreo", "el error máximo admisible con un nivel de confianza fijado"), ".<br/>")
      if (input$estimation_precision == "error_muestreo") {
        resumen <- paste0(resumen, "El error de muestreo especificado es de ", input$sampling_error, ".<br/>")
      } else {
        resumen <- paste0(resumen, "El error máximo admisible es de ", input$max_error, " con un nivel de confianza de ", input$confidence_level * 100, "%.<br/>")
      }
      resumen <- paste0(resumen, "<br/><b>El tamaño muestral requerido es: ", n, "</b>")
      
      result(HTML(resumen))
    } else {
      result(HTML("Corrige los errores antes de continuar."))
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
