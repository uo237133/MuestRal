#formulas.R
#----------

# Función para calcular el tamaño muestral para una media
calcular_tamano_muestral_media <- function(sd, conf_level, margin_error) {
  z <- qnorm(1 - (1 - conf_level) / 2)
  n <- (z * sd / margin_error) ^ 2
  n <- ceiling(n)  # Redondea al siguiente número entero
  return(n)
}

# Función para calcular el tamaño muestral para muestreo simple con reposición
calcular_tamano_muestral_con_reposicion <- function(p, conf_level, margin_error) {
  z <- qnorm(1 - (1 - conf_level) / 2)
  n <- (z^2 * p * (1 - p)) / margin_error^2
  n <- ceiling(n)  # Redondea al siguiente número entero
  return(n)
}
