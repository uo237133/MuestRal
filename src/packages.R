# src/packages.R

# Instalar y cargar los paquetes necesarios
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

# Cargar fórmulas
source("formulas.R")

# Añadir la ruta de los recursos estáticos
addResourcePath("img", "../img")

# Cargar archivos UI
source("tabs/ui_inicio.R")
source("tabs/ui_calculo.R")
source("tabs/ui_ayuda.R")