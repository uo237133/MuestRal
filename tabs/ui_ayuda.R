# tabs/ui_ayuda.R

ui_ayuda <- tabItem(
  tabName = "ayuda",
  fluidRow(
    box(
      title = "Información sobre el Tamaño Muestral",
      status = "info",
      solidHeader = TRUE,
      width = 12,
      withMathJax(help_content)
    )
  )
)
