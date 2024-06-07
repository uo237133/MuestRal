# src/server.R

server <- function(input, output, session) {
  result <- eventReactive(input$calculate, {
    validate(
      need(input$sampling_type, "Selecciona un tipo de muestreo."),
      need(input$conf_level > 0 & input$conf_level < 1, "El nivel de confianza debe estar entre 0 y 1."),
      need(input$margin_error > 0, "El margen de error debe ser mayor que 0.")
    )
    
    if (input$sampling_type == "media") {
      validate(
        need(input$sd > 0, "La desviación estándar debe ser mayor que 0.")
      )
      n <- calcular_tamano_muestral_media(input$sd, input$conf_level, input$margin_error)
      list(n = n, type = "media")
    } else if (input$sampling_type == "proporcion_reposicion") {
      validate(
        need(input$p > 0 & input$p < 1, "La proporción debe estar entre 0 y 1.")
      )
      n <- calcular_tamano_muestral_con_reposicion(input$p, input$conf_level, input$margin_error)
      list(n = n, type = "proporcion_reposicion")
    } else if (input$sampling_type == "proporcion_poblacion_finita") {
      validate(
        need(input$N > 0, "El tamaño de la población debe ser mayor que 0."),
        need(input$p > 0 & input$p < 1, "La proporción debe estar entre 0 y 1.")
      )
      n <- calcular_tamano_muestral_sin_reposicion(input$N, input$p, input$conf_level, input$margin_error)
      list(n = n, type = "proporcion_poblacion_finita")
    } else if (input$sampling_type == "diferencia_medias") {
      validate(
        need(input$sd1 > 0, "La desviación estándar de la primera población debe ser mayor que 0."),
        need(input$sd2 > 0, "La desviación estándar de la segunda población debe ser mayor que 0.")
      )
      n <- calcular_tamano_muestral_diferencia_medias(input$sd1, input$sd2, input$conf_level, input$margin_error)
      list(n = n, type = "diferencia_medias")
    }
  })
  
  output$result <- renderPrint({
    res <- result()
    if (!is.null(res)) {
      if (res$type == "media") {
        paste("El tamaño muestral requerido para estimar la media es:", res$n)
      } else if (res$type == "proporcion_reposicion") {
        paste("El tamaño muestral requerido para estimar la proporción (con reposición) es:", res$n)
      } else if (res$type == "proporcion_poblacion_finita") {
        paste("El tamaño muestral requerido para estimar la proporción (población finita) es:", res$n)
      } else if (res$type == "diferencia_medias") {
        paste("El tamaño muestral requerido para la diferencia entre dos medias es:", res$n)
      }
    }
  })
}

