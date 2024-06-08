# ui_acerca_de.R

ui_acerca_de <- tabItem(
  tabName = "acerca_de",
  fluidRow(
    box(
      title = "Acerca de",
      status = "info",
      solidHeader = TRUE,
      width = 12,
      h3("Nombre del Proyecto:"),
      p("Cálculo del Tamaño Muestral"),
      h3("Versión:"),
      p("1.0.0"),
      h3("Desarrollador:"),
      p("Tu Nombre"),
      h3("Licencia:"),
      p("Este proyecto está bajo la Licencia MIT. Para más detalles, consulte el archivo LICENSE."),
      h3("Descripción:"),
      p("Esta aplicación calcula el tamaño muestral necesario para diferentes tipos de estudios, incluyendo estimación de medias y proporciones, así como la diferencia entre dos medias. Proporciona una interfaz fácil de usar para investigadores y estudiantes.")
    )
  )
)
