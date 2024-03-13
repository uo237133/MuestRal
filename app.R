# Carga de la librería Shiny
library(shiny)

# Define la interfaz de usuario (UI)
ui <- fluidPage(
    # Título de la aplicación
    titlePanel("Calculadora Simple"),
    
    # Entrada para que el usuario introduzca un número
    sidebarLayout(
        sidebarPanel(
            numericInput("numero", label = "Introduce un número:", value = 1)
        ),
        
        # Salida para mostrar el resultado del cálculo
        mainPanel(
            textOutput("resultado_texto")
        )
    )
)

# Define la lógica del servidor
server <- function(input, output) {
    # Definir la fórmula para el cálculo
    calcular_resultado <- function(numero) {
        # Aquí puedes ingresar tu fórmula
        # Por ejemplo, si quieres calcular el cuadrado del número:
        resultado <- numero^2
        return(resultado)
    }
    
    # Calcular el resultado basado en la entrada del usuario
    resultado <- reactive({
        calcular_resultado(input$numero)
    })
    
    # Mostrar el resultado en la interfaz
    output$resultado_texto <- renderText({
        paste("El resultado del cálculo es:", resultado())
    })
}

# Crea la aplicación Shiny
shinyApp(ui = ui, server = server)
