# ui_home.R

ui_home <- tabItem(
  tabName = "home",
  fluidRow(
    box(
      title = "Bienvenido",
      status = "primary",
      solidHeader = TRUE,
      width = 12,
      img(src = "img/tu_foto.jpg", height = "400px"),
      h2("RShinyMuestreo"),
      p("Cálculo del Tamaño Muestral.")
    )
  )
)
