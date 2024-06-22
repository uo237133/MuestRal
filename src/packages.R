# src/packages.R

# Cargar librerías
#library(shiny)
#library(shinydashboard)
#library(shinyFeedback)
#library(shinyBS)

# Install and load packages
list.of.packages <- c("shiny",
                      "shinydashboard",
                      "shinyFeedback",
                      "shinyBS")
new.packages <- list.of.packages[!(list.of.packages %in%
                                     installed.packages()[, "Package"])]
if (length(new.packages)) {
  install.packages(new.packages)
}
lapply(list.of.packages,
       function(pkg) {
         library(pkg, character.only = TRUE)
       })

# Cargar archivos de configuración
source("formulas.R")

# Añadir la ruta de los recursos estático
addResourcePath("img", "../img")

# Cargar archivos UI
source("tabs/ui_inicio.R")
source("tabs/ui_calculo.R")
source("tabs/ui_ayuda.R")