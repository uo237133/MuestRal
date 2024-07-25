#formulas_AL.R

###############################################################
#################
#Determinacion tama o muestral para estimar MEDIA POBLACIONAL
#################
###############################################################

# Se necesita estimacion de la varianza poblacional  =S2 




#################
# CASO 1:
# Se fija error de muestreo e
#################

tamanomuestral.media.errormuestreo<-function(S2,e,N=NULL){
  
    n0<-S2/e^2 
  
    if(is.null(N)){
    salida<-list(m.a.c.r. = ceiling(n0)) 
  }
  else  if(!is.null(N)){
    n<-n0/(1+(n0/N))
        salida<-list(m.a.s.=ceiling(n))
    }
    return(salida)
}

#############################################
#Ejemplo CASO 1

publicaciones<-0:10 #valores de la variable Y
profesores<-c(28,4,3,4,4,2,1,0,2,1,1) #frecuencias absolutas de las modalidades de Y
muestra<-rep(publicaciones, profesores) #muestra observada de Y

n1<-length(muestra)  #tama o muestral
m1<-mean(muestra) #media muestral
s12<-var(muestra);s12 #varianza muestral

S2<-s12 #varianza poblacional

tamanomuestral.media.errormuestreo(S2,e=0.25,N=807)
tamanomuestral.media.errormuestreo(S2,e=0.25)
############################################################################


#######################################################
# CASO 2:
# Se fija error maximo permitido ealpha
#y nivel de confianza prefijado = 1 - alpha

########################################################

tamanomuestral.media.confianza<-function(S2,ealpha,alpha,N=NULL){
  
  
  zalpha<-qnorm(1-alpha/2)
  
  n01<-zalpha^2*S2/ealpha^2 #si se cumple la aproximacion normal (condicion n>=30)
  
  n02<-s2/(alpha*ealpha^2)  #si se aplica desigualdad de Tchebychev (no se necesita condicion)
  
  if(n01>=30){ n0<-n01} else {n0<-n02}
  
  if(is.null(N)){
    salida<-list(m.a.c.r. = ceiling(n0)) 
  }
  else  if(!is.null(N)){
    n1<-n01/(1+(n01/N))
    n2<-n02/(1+(n02/N))
    if(n1>=100){
      salida<-list(m.a.s.=ceiling(n1))
    } 
    else {
      salida<-list(m.a.s.=ceiling(n2))
    }
  }
  return(salida)
}

##########################################################
#Ejemplo CASO 2

publicaciones<-0:10 #valores de la variable Y
profesores<-c(28,4,3,4,4,2,1,0,2,1,1) #frecuencias absolutas de las modalidades de Y
muestra<-rep(publicaciones, profesores) #muestra observada de Y

n1<-length(muestra)  #tama o muestral
m1<-mean(muestra) #media muestral
s12<-var(muestra);s12 #varianza muestral

S2<-s12 #varianza poblacional

tamanomuestral.media.confianza(S2,ealpha=3,alpha=0.05,N=807)
tamanomuestral.media.confianza(S2,ealpha=1,alpha=0.05)



####################################################
#################
#Determinacion tama o muestral para estimar PROPORCION POBLACIONAL
#################
####################################################


# Se necesita estimacion de la proporcion = P


#################
# CASO 1:
# Se fija error de muestreo e
#################

tamanomuestral.proporcion.errormuestreo<-function(P,e,N=NULL){
  
  n0<-P*(1-P)/e^2 
  
  if(is.null(N)){
    salida<-list(m.a.c.r. = ceiling(n0)) 
  }
  else  if(!is.null(N)){
    n<-n0/(1+((n0-1)/N))
    salida<-list(m.a.s.=ceiling(n))
  }
  return(salida)
}

#Ejemplo CASO 1

tamanomuestral.proporcion.errormuestreo(P=0.5,e=0.1,N=NULL)
tamanomuestral.proporcion.errormuestreo(P=0.25,e=0.1,N=NULL)

tamanomuestral.proporcion.errormuestreo(P=0.5,e=0.01,N=807)

tamanomuestral.proporcion.errormuestreo(P=0.25,e=0.01,N=807)




#################
# CASO 2:
# Se fija error maximo permitido ealpha
#y nivel de confianza prefijado = 1 - alpha

#################

tamanomuestral.proporcion.confianza<-function(P,ealpha,alpha,N=NULL){
  
  zalpha<-qnorm(1-alpha/2)
  
    n01<-(zalpha^2*P*(1-P))/(ealpha^2) #tama o muestral m.a.c.r. y suponiendo normalidad
    n02<-P*(1-P)/(alpha*ealpha^2) #tama o muestral m.a.c.r. y con des. Tchebychev 
    
    if(n01>=30){n0<-n01} else {n0<-n02} 
    if(is.null(N)){
      salida<-list(m.a.c.r. = ceiling(n0)) 
    }
    else  if(!is.null(N)){
      n1<-n01/(1+((n01-1)/N)) #tama o muestral m.a.s. y suponiendo normalidad
      n2<-n02/(1+((n02-1)/N)) #tama o muestral m.a.s. y con des. Tchebychev
      if(N>=60&n1/N<=0.1){
          salida<-list(m.a.s.=ceiling(n1))
        } 
        else {
          salida<-list(m.a.s.=ceiling(n2))
        }
  }
  
  return(salida)
}


#Ejemplo CASO 2
tamanomuestral.proporcion.confianza(P=0.5,ealpha=0.1,alpha=0.05,N=NULL)
tamanomuestral.proporcion.confianza(P=0.25,ealpha=0.1,alpha=0.05,N=NULL)

tamanomuestral.proporcion.confianza(P=0.5,ealpha=0.1,alpha=0.05,N=807)
tamanomuestral.proporcion.confianza(P=0.25,ealpha=0.1,alpha=0.05,N=807)

