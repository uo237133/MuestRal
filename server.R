#server.R
#----------

library(shiny)

# Define el servidor
server <- function(input, output, session) {
  observeEvent(input$help, {
    showModal(modalDialog(
      title = "Ayuda: Tamaño Muestral",
      withMathJax(help_content),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  output$result <- renderPrint({
    if (input$sampling_type == "sin_reposicion") {
      req(input$sd, input$conf_level, input$margin_error)
      n <- calcular_tamano_muestral_media(input$sd, input$conf_level, input$margin_error)
      paste("El tamaño muestral requerido (sin reposición) es:", n)
    } else if (input$sampling_type == "con_reposicion") {
      req(input$p, input$conf_level_repos, input$margin_error_repos)
      n <- calcular_tamano_muestral_con_reposicion(input$p, input$conf_level_repos, input$margin_error_repos)
      paste("El tamaño muestral requerido (con reposición) es:", n)
    }
  })
}
