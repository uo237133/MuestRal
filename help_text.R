# help_text.R

help_content <- HTML('
  <p>El tamaño muestral es el número de observaciones o replicaciones que se incluyen en un estudio. Es importante para asegurar que los resultados del estudio sean estadísticamente significativos.</p>
  <p>La fórmula general para calcular el tamaño muestral para una media es:</p>
  <p>$$n = \\left( \\frac{Z \\cdot \\sigma}{E} \\right)^2$$</p>
  <p>La fórmula general para calcular el tamaño muestral para una proporción con reposición es:</p>
  <p>$$n = \\frac{Z^2 \\cdot p \\cdot (1 - p)}{E^2}$$</p>
  <p>donde:<br>
  <ul>
    <li><b>Z</b>: Puntaje Z (dependiendo del nivel de confianza deseado)</li>
    <li><b>\\(\\sigma\\)</b>: Desviación estándar de la población</li>
    <li><b>p</b>: Proporción esperada de la población</li>
    <li><b>E</b>: Margen de error permitido</li>
  </ul>
  </p>
  <p>Para usar esta aplicación, selecciona el tipo de muestreo, ingresa los parámetros requeridos y presiona el botón de calcular.</p>
')
