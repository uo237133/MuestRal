# src/tabs/ui_inicio.R

ui_inicio <- fluidRow(column(
  width = 12,
  box(
    title = "Inicio",
    status = "primary",
    solidHeader = TRUE,
    width = 12,
    height = "auto",
    tags$div(
      style = "text-align: center;",
      tags$img(
        src = "img/MuestRal_Web_Banner.png",
        alt = "MuestRal",
        height = "300px",
        style = "max-width: 100%; height: auto;"
      ),
      tags$h4("MuestRal", style = "margin-top: 20px;"),
      tags$p(
        "Aplicación web interactiva para el cálculo del tamaño muestral con Shiny."
      ),
      tags$hr(),
      tags$h2("Acerca de"),
      tags$p(
        "MuestRal es una herramienta diseñada para investigadores, estadísticos y cualquier persona interesada en calcular tamaños muestrales para estudios de investigación."
      ),
      tags$p(
        "Esta aplicación permite calcular el tamaño muestral necesario para estimar medias y proporciones poblacionales utilizando diferentes metodologías y parámetros."
      ),
      tags$p("Desarrollador: Iñaki Salgado Uralde"),
      tags$p("Versión: 1.0.0"),
      tags$p("Licencia: Esta aplicación se distribuye bajo la licencia MIT."),
      tags$hr(),
      tags$h2("Contacto"),
      tags$p(
        "Para más información o soporte, puede contactar al desarrollador:"
      ),
      tags$p(
        "Correo electrónico: ",
        tags$a(href = "mailto:UO237133@uniovi.es", "UO237133@uniovi.es")
      ),
      tags$p(
        "Repositorio de GitHub: ",
        tags$a(href = "https://github.com/uo237133/MuestRal", "https://github.com/uo237133/MuestRal")
      ),
      tags$hr(),
      tags$h2("Agradecimientos"),
      tags$p(
        "Este proyecto fue desarrollado en colaboración con la Universidad de Oviedo y la Escuela de Ingeniería Informática de Oviedo."
      ),
      tags$div(
        style = "text-align: center;",
        tags$img(
          src = "img/universidad_oviedo.png",
          alt = "Universidad de Oviedo",
          height = "150px",
          style = "margin: 10px;"
        ),
        tags$img(
          src = "img/ingenieria_informatica_oviedo.png",
          alt = "Escuela de Ingenieria Informatica",
          height = "150px",
          style = "margin: 10px;"
        )
      ),
      tags$hr(),
      tags$h2("Referencias"),
      tags$p(
        "Pérez López, C. (2005). Muestreo estadístico: conceptos y problemas resueltos."
      ),
      tags$p(
        tags$a(href = "https://shiny.rstudio.com/articles/", "Shiny Documentation - RStudio")
      ),
      tags$p(
        tags$a(href = "https://cran.r-project.org/manuals.html", "R Project Documentation")
      )
    )
  )
))
