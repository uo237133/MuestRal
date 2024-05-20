# server.R
library(shiny)
library(ggplot2)  # Asegúrate de incluir esta línea

# Define server logic required to calculate results and plot
server <- function(input, output, session) {
  resultado <- eventReactive(input$calcular, {
    switch(input$metodo,
           "m1" = input$numero^2,  # Método 1: Cuadrado del número
           "m2" = sqrt(input$numero)  # Método 2: Raíz cuadrada del número
    )
  })
  
  output$resultado_texto <- renderText({
    paste("El resultado del cálculo es:", resultado())
  })
  
  output$plot <- renderPlot({
    data <- data.frame(x = 1:10, y = resultado() * (1:10))
    ggplot(data, aes(x, y)) + geom_line() +
      labs(title = "Gráfico de Resultados", x = "Factor", y = "Resultado Calculado")
  })
}
