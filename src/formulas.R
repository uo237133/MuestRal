# src/formulas.R

# Función para calcular el tamaño muestral para una MEDIA
calcular_tamano_muestral_media <-
  function(metodo, N, var, e, nivel_confianza = NULL) {
    if (is.null(nivel_confianza)) {
      # ERROR DE MUESTREO
      n0 <- var / e ^ 2
      if (metodo == "MAS" && !is.null(N)) {
        n <- n0 / (1 + (n0 / N))
        #tamaño muestral m.a.s. y error muestreo
        salida <- list(m.a.s. = ceiling(n))
      } else {
        #tamaño muestral m.a.c.r. y error muestreo
        salida <- list(m.a.c.r. = ceiling(n0))
      }
    } else {
      # ERROR MAXIMO ADMISIBLE CON COEFICIENTE DE CONFIANZA FIJADO
      zalpha <- qnorm(1 - nivel_confianza / 2)
      
      #tamaño muestral m.a.c.r. y suponiendo normalidad
      n01 <- zalpha * var / e ^ 2
      #tamaño muestral m.a.c.r. y con des. Tchebychev
      n02 <- var / (nivel_confianza * e ^ 2)
      
      if (n01 >= 30) {
        n0 <- n01
      }
      else {
        n0 <- n02
      }
      
      if (metodo == "MAS" && !is.null(N)) {
        #tamaño muestral m.a.s. y suponiendo normalidad
        n1 <- n01 / (1 + (n01 / N))
        #tamaño muestral m.a.s. y con des. Tchebychev
        n2 <- n02 / (1 + (n02 / N))
        if (n1 >= 100) {
          salida <- list(m.a.s. = ceiling(n1))
        }
        else {
          salida <- list(m.a.s. = ceiling(n2))
        }
      } else {
        salida <- list(m.a.c.r. = ceiling(n0))
      }
    }
    return(salida)
  }

# Función para calcular el tamaño muestral para una PROPORCION
calcular_tamano_muestral_proporcion <-
  function(metodo, N, P, e, nivel_confianza = NULL) {
    if (is.null(nivel_confianza)) {
      # ERROR DE MUESTREO
      n0 <- P * (1 - P) / e ^ 2
      if (metodo == "MAS" && !is.null(N)) {
        n <- n0 / (1 + ((n0 - 1) / N))
        #tamaño muestral m.a.s. y error muestreo
        salida <- list(m.a.s. = ceiling(n))
      } else {
        #tamaño muestral m.a.c.r. y error muestreo
        salida <- list(m.a.c.r. = ceiling(n0))
      }
    } else {
      # ERROR MAXIMO ADMISIBLE CON COEFICIENTE DE CONFIANZA FIJADO
      zalpha <- qnorm(1 - nivel_confianza / 2)
      
      #tamaño muestral m.a.c.r. y suponiendo normalidad
      n01 <- (zalpha ^ 2 * P * (1 - P)) / (e ^ 2)
      #tamaño muestral m.a.c.r. y con des. Tchebychev
      n02 <- P * (1 - P) / (nivel_confianza * e ^ 2)
      
      if (n01 >= 30) {
        n0 <- n01
      }
      else {
        n0 <- n02
      }
      if (metodo == "MAS" && !is.null(N)) {
        #tamaño muestral m.a.s. y suponiendo normalidad
        n1 <- n01 / (1 + ((n01 - 1) / N))
        #tamaño muestral m.a.s. y con des. Tchebychev
        n2 <- n02 / (1 + ((n02 - 1) / N))
        if (N >= 60 && n2 / N <= 0.1) {
          salida <- list(m.a.s. = ceiling(n1))
        }
        else {
          salida <- list(m.a.s. = ceiling(n2))
        }
      } else {
        salida <- list(m.a.c.r. = ceiling(n0))
      }
    }
    return(salida)
  }
