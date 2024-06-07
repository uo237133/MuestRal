# packages.R

# Cargar librerías
library(shiny)
library(shinythemes)
library(shinyjs)
library(shinydashboard)

# Cargar archivos de configuración
source("formulas.R")
source("help_text.R")
addResourcePath("img", "img")

# Cargar archivos UI
source("tabs/ui_home.R")
source("tabs/ui_calculo.R")
source("tabs/ui_ayuda.R")
source("tabs/ui_acerca_de.R")