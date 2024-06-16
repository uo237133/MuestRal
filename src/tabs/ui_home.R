# src/tabs/ui_home.R

ui_home <- tabItem(
  tabName = "home",
  fluidRow(
    box(
      title = "Bienvenido",
      status = "primary",
      solidHeader = TRUE,
      width = 12,
      img(src = "img/RShinyMuestreo_Web_Banner.png", style = "width: 100%; height: auto;"),
      h2("RShinyMuestreo"),
      p("Cálculo del Tamaño Muestral.")
    )
  )
)
