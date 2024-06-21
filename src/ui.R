# src/ui.R

source("packages.R")

ui <- dashboardPage(
  dashboardHeader(title = "MuestRal"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Inicio", tabName = "inicio", icon = icon("home")),
      menuItem("Cálculo", tabName = "calculo", icon = icon("calculator")),
      menuItem("Ayuda", tabName = "ayuda", icon = icon("info-circle"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "inicio", ui_inicio),
      tabItem(tabName = "calculo", ui_calculo),
      tabItem(tabName = "ayuda", ui_ayuda)
    )
  )
)
