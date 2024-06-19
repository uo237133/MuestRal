# src/tabs/ui_home.R

ui_home <- fluidRow(
    column(
      width = 12,
      box(
        title = "Bienvenido a RShinyMuestreo",
        status = "primary",
        solidHeader = TRUE,
        width = 12,
        height = "auto",
        tags$div(
          style = "text-align: center;",
          tags$img(src = "img/RShinyMuestreo_Web_Banner.png", height = "300px", style = "max-width: 100%; height: auto;"),
          tags$h4("RShinyMuestreo", style = "margin-top: 20px;"),
          tags$p("Una aplicación Shiny para calcular tamaños muestrales de manera eficiente y precisa."),
          tags$hr(),
          tags$h2("Acerca de"),
          tags$p("RShinyMuestreo es una herramienta diseñada para investigadores, estadísticos y cualquier persona interesada en calcular tamaños muestrales para estudios de investigación. Esta aplicación permite calcular el tamaño muestral necesario para estimar medias y proporciones poblacionales utilizando diferentes metodologías y parámetros."),
          tags$p("Desarrollador: Iñaki Salgado Uralde"),
          tags$p("Versión: 1.0.0"),
          tags$p("Licencia: Esta aplicación se distribuye bajo la licencia MIT."),
          tags$hr(),
          tags$h2("Contacto"),
          tags$p("Para más información o soporte, puede contactar al desarrollador a través de [UO237133@uniovi.es]."),
          tags$p("Repositorio de GitHub: [https://github.com/uo237133/RShinyMuestreo](https://github.com/uo237133/RShinyMuestreo)"),
          tags$hr(),
          tags$h2("Agradecimientos"),
          tags$p("Este proyecto fue desarrollado en colaboración con la Universidad de Oviedo y la Escuela de Ingeniería Informática de Oviedo."),
          tags$div(
            style = "text-align: center;",
            tags$img(src = "img/universidad_oviedo.png", height = "150px", style = "margin: 10px;"),
            tags$img(src = "img/ingenieria_informatica_oviedo.png", height = "150px", style = "margin: 10px;")
          )
        )
      )
    )
  )
