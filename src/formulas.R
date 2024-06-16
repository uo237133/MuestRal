# src/formulas.R

# Función para calcular el tamaño muestral para una media
calcular_tamano_muestreo_media <- function(metodo, N, var, e, nivel_confianza = NULL) {
  if (is.null(nivel_confianza)) {
    # Error de Muestreo
    n0<-var/e^2
    if (metodo == "MAS" && !is.null(N)) {
      n<-n0/(1+(n0/N))
      salida<-list(m.a.s.=ceiling(n))
    } else {
      salida<-list(m.a.c.r. = ceiling(n0))
    }
  } else {
    # Error Máximo Admisible con Coeficiente de Confianza Fijado
    zalpha<-qnorm(1-nivel_confianza/2)

      n01<-zalpha*var/e^2 #si se cumple la aproximacion normal (condicion n>=30)
      n02<-var/(nivel_confianza*e^2)  #si se aplica desigualdad de Tchebychev (no se necesita condicion)
    
    if (n01>=30){
      n0<-n01
    } 
    else {
      n0<-n02
    }
    
    if (metodo == "MAS" && !is.null(N)) {
      n1<-n01/(1+(n01/N))
      n2<-n02/(1+(n02/N))
      if(n1>=100){
        salida<-list(m.a.s.=ceiling(n1))
      } 
      else {
        salida<-list(m.a.s.=ceiling(n2))
      }
    } else {
      salida<-list(m.a.c.r. = ceiling(n0))
    }
  }
  return(salida)
}

# Función para calcular el tamaño muestral para una proporción
calcular_tamano_muestreo_proporcion <- function(metodo, N, P, e, nivel_confianza = NULL) {
  if (is.null(nivel_confianza)) {
    # Error de Muestreo
    n0<-P*(1-P)/e^2
    if (metodo == "MAS" && !is.null(N)) {
      n<-n0/(1+((n0-1)/N))
      salida<-list(m.a.s.=ceiling(n))
    } else {
      salida<-list(m.a.c.r. = ceiling(n0))
    }
  } else {
    # Error Máximo Admisible con Coeficiente de Confianza Fijado
    zalpha<-qnorm(1-nivel_confianza/2)

      n01<-(zalpha^2*P*(1-P))/(e^2) #tamaño muestral m.a.c.r. y suponiendo normalidad
      n02<-P*(1-P)/(nivel_confianza*e^2) #tamaño muestral m.a.c.r. y con des. Tchebychev 
    
    if(n01>=30) {
      n0<-n01
    }
    else {
      n0<-n02
    } 
    if (metodo == "MAS" && !is.null(N)) {
      n1<-n01/(1+((n01-1)/N)) #tamaño muestral m.a.s. y suponiendo normalidad
      n2<-n02/(1+((n02-1)/N)) #tamaño muestral m.a.s. y con des. Tchebychev
      if (N>=60 && n2/N<=0.1) {
        salida<-list(m.a.s.=ceiling(n1))
      } 
      else {
        salida<-list(m.a.s.=ceiling(n2))
      }
    } else {
      salida<-list(m.a.c.r. = ceiling(n0))
    }
  }
  return(salida)
}
