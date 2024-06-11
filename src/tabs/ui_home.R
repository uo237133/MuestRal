# ui_home.R

ui_home <- tabItem(
  tabName = "home",
  fluidRow(
    box(
      title = "Bienvenido",
      status = "primary",
      solidHeader = TRUE,
      width = 12,
      img(src = "img/RShinyMuestreo_Web_Banner.png", height = "350px"),
      h2("RShinyMuestreo"),
      p("Cálculo del Tamaño Muestral.")
    )
  )
)
