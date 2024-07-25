# src/packages.R

# Establecer el repositorio CRAN
options(repos = c(CRAN = "https://cran.rstudio.com/"))

# El resto del código de instalación de paquetes
if (!requireNamespace("shiny", quietly = TRUE)) install.packages("shiny")
if (!requireNamespace("shinydashboard", quietly = TRUE)) install.packages("shinydashboard")
if (!requireNamespace("shinyBS", quietly = TRUE)) install.packages("shinyBS")
if (!requireNamespace("shinyFeedback", quietly = TRUE)) install.packages("shinyFeedback")

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
source("src/formulas.R")

# Añadir la ruta de los recursos estáticos
addResourcePath("img", "./img")

# Cargar archivos UI
source("src/tabs/ui_inicio.R")
source("src/tabs/ui_calculo.R")
source("src/tabs/ui_ayuda.R")