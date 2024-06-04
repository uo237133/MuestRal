#server.R
#----------

library(shiny)
library(shinyjs)
library(ggplot2)

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
    
    if (input$sampling_type == "sin_reposicion") {
      validate(
        need(input$sd > 0, "La desviación estándar debe ser mayor que 0.")
      )
      n <- calcular_tamano_muestral_media(input$sd, input$conf_level, input$margin_error)
      list(n = n, type = "sin_reposicion")
    } else if (input$sampling_type == "con_reposicion") {
      validate(
        need(input$p > 0 & input$p < 1, "La proporción debe estar entre 0 y 1.")
      )
      n <- calcular_tamano_muestral_con_reposicion(input$p, input$conf_level, input$margin_error)
      list(n = n, type = "con_reposicion")
    }
  })
  
  output$result <- renderPrint({
    res <- result()
    if (!is.null(res)) {
      if (res$type == "sin_reposicion") {
        paste("El tamaño muestral requerido (sin reposición) es:", res$n)
      } else if (res$type == "con_reposicion") {
        paste("El tamaño muestral requerido (con reposición) es:", res$n)
      }
    }
  })
  
  output$samplePlot <- renderPlot({
    res <- result()
    if (!is.null(res)) {
      if (res$type == "sin_reposicion") {
        data <- data.frame(x = 1:res$n, y = rnorm(res$n, mean = 0, sd = input$sd))
        ggplot(data, aes(x = x, y = y)) +
          geom_point() +
          labs(title = "Muestreo Simple sin Reposición", x = "Índice de Muestra", y = "Valor")
      } else if (res$type == "con_reposicion") {
        data <- data.frame(x = 1:res$n, y = rbinom(res$n, size = 1, prob = input$p))
        ggplot(data, aes(x = x, y = y)) +
          geom_bar(stat = "identity") +
          labs(title = "Muestreo Simple con Reposición", x = "Índice de Muestra", y = "Valor")
      }
    }
  })
}
