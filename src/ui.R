# ui.R

source("packages.R")

ui <- dashboardPage(
  dashboardHeader(title = "RShinyMuestreo"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Cálculo", tabName = "calculo", icon = icon("calculator")),
      menuItem("Ayuda", tabName = "ayuda", icon = icon("info-circle")),
      menuItem("Acerca de", tabName = "acerca_de", icon = icon("info"))
    )
  ),
  dashboardBody(
    useShinyjs(),
    tabItems(
      ui_home,
      ui_calculo,
      ui_ayuda,
      ui_acerca_de
    )
  )
)
