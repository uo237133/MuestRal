# src/tabs/ui_home.R

ui_home <- tabItem(
  tabName = "home",
  fluidRow(
    box(
      title = "Bienvenido",
      status = "primary",
      solidHeader = TRUE,
      width = 12,
      img(src = "img/tu_foto.jpg", height = "400px"),  # Asegúrate de tener la foto en el directorio img
      h2("Nombre de la Aplicación"),
      p("Descripción breve del proyecto.")
    )
  )
)
