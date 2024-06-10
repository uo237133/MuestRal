# ui_ayuda.R

help_content <- HTML('
  <h3>Ayuda: Tamaño Muestral</h3>
  
  <p>El tamaño muestral es el número de observaciones o replicaciones que se incluyen en un estudio. Es importante para asegurar que los resultados del estudio sean estadísticamente significativos y representativos de la población.</p>
  
  <h4>Tipos de Muestreo</h4>
  <ul>
    <li><b>Muestreo Aleatorio Simple (M.A.S)</b>: Cada miembro de la población tiene la misma probabilidad de ser seleccionado.</li>
    <li><b>Muestreo Aleatorio con Reposición (M.A.C.R)</b>: Cada miembro de la población puede ser seleccionado más de una vez.</li>
  </ul>
  
  <h4>Parámetros de Interés</h4>
  <ul>
    <li><b>Media Poblacional</b>: Estimación de la media de la población.</li>
    <li><b>Proporción Poblacional</b>: Estimación de la proporción de la población que tiene una característica específica.</li>
  </ul>
  
  <h4>Precisión de la Estimación</h4>
  <ul>
    <li><b>Error de Muestreo</b>: La diferencia máxima aceptable entre el valor estimado a partir de la muestra y el valor verdadero en la población.</li>
    <li><b>Error Máximo Admisible con Coeficiente de Confianza Fijado</b>: El máximo error admisible dado un nivel de confianza específico.</li>
  </ul>
  
  <h4>Fórmulas para Calcular el Tamaño Muestral</h4>
  
  <h5>Para la Media Poblacional</h5>
  <p><b>Muestreo Aleatorio Simple (M.A.S)</b></p>
  <p>Con error de muestreo:</p>
  <p>\\( n = \\left( \\frac{Z \\cdot \\sigma}{E} \\right)^2 \\)</p>
  <p>Con error máximo admisible:</p>
  <p>\\( n = \\left( \\frac{Z \\cdot \\sigma}{E_{max}} \\right)^2 \\)</p>
  
  <p><b>Muestreo Aleatorio con Reposición (M.A.C.R)</b></p>
  <p>Con error de muestreo:</p>
  <p>\\( n = \\left( \\frac{Z \\cdot \\sigma}{E} \\right)^2 \\)</p>
  <p>Con error máximo admisible:</p>
  <p>\\( n = \\left( \\frac{Z \\cdot \\sigma}{E_{max}} \\right)^2 \\)</p>
  
  <h5>Para la Proporción Poblacional</h5>
  <p><b>Muestreo Aleatorio Simple (M.A.S)</b></p>
  <p>Con error de muestreo:</p>
  <p>\\( n = \\frac{Z^2 \\cdot p \\cdot (1 - p)}{E^2} \\)</p>
  <p>Con error máximo admisible:</p>
  <p>\\( n = \\frac{Z^2 \\cdot p \\cdot (1 - p)}{E_{max}^2} \\)</p>
  
  <p><b>Muestreo Aleatorio con Reposición (M.A.C.R)</b></p>
  <p>Con error de muestreo:</p>
  <p>\\( n = \\frac{Z^2 \\cdot p \\cdot (1 - p)}{E^2} \\)</p>
  <p>Con error máximo admisible:</p>
  <p>\\( n = \\frac{Z^2 \\cdot p \\cdot (1 - p)}{E_{max}^2} \\)</p>
  
  <h4>Ejemplos de Uso</h4>
  <p><b>Media Poblacional:</b> Si queremos estimar la media de una población con una desviación estándar de 10, un nivel de confianza del 95% y un error máximo admisible de 2, la fórmula sería:</p>
  <p>\\( n = \\left( \\frac{1.96 \\cdot 10}{2} \\right)^2 = 96.04 \\)</p>
  <p>Redondeando al siguiente número entero, necesitamos un tamaño muestral de 97.</p>
  
  <p><b>Proporción Poblacional:</b> Si queremos estimar la proporción de una característica con un nivel de confianza del 95%, una proporción esperada de 0.5 y un error máximo admisible de 0.05, la fórmula sería:</p>
  <p>\\( n = \\frac{1.96^2 \\cdot 0.5 \\cdot (1 - 0.5)}{0.05^2} = 384.16 \\)</p>
  <p>Redondeando al siguiente número entero, necesitamos un tamaño muestral de 385.</p>
')

ui_ayuda <- tabItem(
  tabName = "ayuda",
  fluidRow(
    box(
      title = "Información sobre el Tamaño Muestral",
      status = "info",
      solidHeader = TRUE,
      width = 12,
      withMathJax(help_content)
    )
  )
)
