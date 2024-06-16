# src/ui.R

source("packages.R")

ui <- dashboardPage(
  dashboardHeader(disable = TRUE),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Cálculo", tabName = "calculo", icon = icon("calculator")),
      menuItem("Ayuda", tabName = "ayuda", icon = icon("info-circle")),
      menuItem("Acerca de", tabName = "acerca_de", icon = icon("info"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "home", ui_home),
      tabItem(tabName = "calculo", ui_calculo),
      tabItem(tabName = "ayuda", ui_ayuda),
      tabItem(tabName = "acerca_de", ui_acerca_de)
    )
  )
)
