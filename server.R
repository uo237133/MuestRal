# server.R

library(shiny)
library(shinyjs)
library(ggplot2)

source("formulas.R")
source("help_text.R")

server <- function(input, output, session) {
  observeEvent(input$help, {
    showModal(modalDialog(
      title = "Ayuda: Tamaño Muestral",
      withMathJax(help_content),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
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
  
  output$samplePlot <- renderPlot({
    res <- result()
    if (!is.null(res)) {
      if (res$type == "media") {
        data <- data.frame(x = 1:res$n, y = rnorm(res$n, mean = 0, sd = input$sd))
        ggplot(data, aes(x = x, y = y)) +
          geom_point() +
          labs(title = "Estimación de una Media", x = "Índice de Muestra", y = "Valor")
      } else if (res$type == "proporcion_reposicion") {
        data <- data.frame(x = 1:res$n, y = rbinom(res$n, size = 1, prob = input$p))
        ggplot(data, aes(x = x, y = y)) +
          geom_bar(stat = "identity") +
          labs(title = "Estimación de una Proporción (con Reposición)", x = "Índice de Muestra", y = "Valor")
      } else if (res$type == "proporcion_poblacion_finita") {
        data <- data.frame(x = 1:res$n, y = rbinom(res$n, size = 1, prob = input$p))
        ggplot(data, aes(x = x, y = y)) +
          geom_bar(stat = "identity") +
          labs(title = "Estimación de una Proporción (Población Finita)", x = "Índice de Muestra", y = "Valor")
      } else if (res$type == "diferencia_medias") {
        data1 <- data.frame(grupo = "Población 1", y = rnorm(res$n, mean = 0, sd = input$sd1))
        data2 <- data.frame(grupo = "Población 2", y = rnorm(res$n, mean = 0, sd = input$sd2))
        data <- rbind(data1, data2)
        ggplot(data, aes(x = grupo, y = y)) +
          geom_boxplot() +
          labs(title = "Comparación de Dos Medias", x = "Grupo", y = "Valor")
      }
    }
  })
  
  output$plotDescription <- renderText({
    res <- result()
    if (!is.null(res)) {
      if (res$type == "media") {
        "Este gráfico muestra una estimación de una media utilizando una distribución normal con la desviación estándar especificada."
      } else if (res$type == "proporcion_reposicion") {
        "Este gráfico muestra una estimación de una proporción (con reposición) utilizando una distribución binomial."
      } else if (res$type == "proporcion_poblacion_finita") {
        "Este gráfico muestra una estimación de una proporción en una población finita utilizando una distribución binomial."
      } else if (res$type == "diferencia_medias") {
        "Este gráfico compara las medias de dos poblaciones utilizando gráficos de cajas para visualizar las distribuciones."
      }
    }
  })
}
