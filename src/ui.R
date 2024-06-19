# src/ui.R

source("packages.R")

ui <- dashboardPage(
  dashboardHeader(disable = TRUE),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Cálculo", tabName = "calculo", icon = icon("calculator")),
      menuItem("Ayuda", tabName = "ayuda", icon = icon("info-circle"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "home", ui_home),
      tabItem(tabName = "calculo", ui_calculo),
      tabItem(tabName = "ayuda", ui_ayuda)
    )
  )
)
