# src/formulas.R

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

# Función para calcular el tamaño muestral para muestreo simple sin reposición
calcular_tamano_muestral_sin_reposicion <- function(N, p, conf_level, margin_error) {
  z <- qnorm(1 - (1 - conf_level) / 2)
  n <- (N * z^2 * p * (1 - p)) / (margin_error^2 * (N - 1) + z^2 * p * (1 - p))
  n <- ceiling(n)  # Redondea al siguiente número entero
  return(n)
}

# Función para calcular el tamaño muestral para la diferencia entre dos medias
calcular_tamano_muestral_diferencia_medias <- function(sd1, sd2, conf_level, margin_error) {
  z <- qnorm(1 - (1 - conf_level) / 2)
  n <- (z * sqrt(sd1^2 + sd2^2) / margin_error) ^ 2
  n <- ceiling(n)  # Redondea al siguiente número entero
  return(n)
}
