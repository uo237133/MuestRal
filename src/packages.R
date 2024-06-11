# packages.R

# Cargar librerías
library(shiny)
library(shinythemes)
library(shinyjs)
library(shinydashboard)
library(shinyFeedback)

# Cargar archivos de configuración
source("formulas.R")

# Añadir la ruta de los recursos estático
addResourcePath("img", "../img")

# Cargar archivos UI
source("tabs/ui_home.R")
source("tabs/ui_calculo.R")
source("tabs/ui_ayuda.R")
source("tabs/ui_acerca_de.R")