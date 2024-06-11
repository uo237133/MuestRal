# ui_acerca_de.R

ui_acerca_de <- tabItem(
  tabName = "acerca_de",
  fluidRow(
    box(
      title = "Acerca de",
      status = "primary",
      solidHeader = TRUE,
      width = 12,
      HTML('
        <h3>Acerca de RShinyMuestreo</h3>
        <p><b>Versión:</b> 1.0.0</p>
        <p><b>Nombre del Proyecto:</b> RShinyMuestreo</p>
        <p><b>Desarrollador:</b>Iñaki Salgado Uralde</p>
        <p><b>Descripción:</b> Esta aplicación está diseñada para calcular el tamaño muestral necesario para estudios estadísticos, ofreciendo opciones para muestreo aleatorio simple y con reposición, y permitiendo la estimación de medias y proporciones poblacionales.</p>
        <p><b>Licencia:</b> Esta aplicación se distribuye bajo la licencia MIT.</p>
      ')
    )
  )
)
