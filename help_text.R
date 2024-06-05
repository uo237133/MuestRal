#help_text.R
#----------

help_content <- HTML('
  <h3>Ayuda: Tamaño Muestral</h3>
  
  <p>El tamaño muestral es el número de observaciones o replicaciones que se incluyen en un estudio. Es importante para asegurar que los resultados del estudio sean estadísticamente significativos y representativos de la población.</p>
  
  <h4>Cálculo del Tamaño Muestral para Estimar una Media</h4>
  <p>Para estimar una media poblacional, utilizamos la siguiente fórmula:</p>
  <p>$$n = \\left( \\frac{Z \\cdot \\sigma}{E} \\right)^2$$</p>
  <p>donde:</p>
  <ul>
    <li><b>n</b>: Tamaño muestral</li>
    <li><b>Z</b>: Valor Z correspondiente al nivel de confianza deseado (por ejemplo, 1.96 para un 95% de confianza)</li>
    <li><b>\\(\\sigma\\)</b>: Desviación estándar de la población</li>
    <li><b>E</b>: Margen de error permitido</li>
  </ul>
  <p><b>Ejemplo:</b> Supongamos que deseamos estimar la media de una población con una desviación estándar de 10, un nivel de confianza del 95% y un margen de error de 2. El cálculo sería:</p>
  <p>$$n = \\left( \\frac{1.96 \\cdot 10}{2} \\right)^2 = 96.04$$</p>
  <p>Redondeando al siguiente número entero, necesitamos un tamaño muestral de 97.</p>
  
  <h4>Cálculo del Tamaño Muestral para Estimar una Proporción (con reposición)</h4>
  <p>Para estimar una proporción poblacional, utilizamos la siguiente fórmula:</p>
  <p>$$n = \\frac{Z^2 \\cdot p \\cdot (1 - p)}{E^2}$$</p>
  <p>donde:</p>
  <ul>
    <li><b>n</b>: Tamaño muestral</li>
    <li><b>Z</b>: Valor Z correspondiente al nivel de confianza deseado</li>
    <li><b>p</b>: Proporción esperada de la población</li>
    <li><b>E</b>: Margen de error permitido</li>
  </ul>
  <p><b>Ejemplo:</b> Supongamos que deseamos estimar la proporción de una característica con un nivel de confianza del 95%, una proporción esperada de 0.5 y un margen de error de 0.05. El cálculo sería:</p>
  <p>$$n = \\frac{1.96^2 \\cdot 0.5 \\cdot (1 - 0.5)}{0.05^2} = 384.16$$</p>
  <p>Redondeando al siguiente número entero, necesitamos un tamaño muestral de 385.</p>
  
  <h4>Cálculo del Tamaño Muestral para Estimar una Proporción (sin reposición)</h4>
  <p>Para estimar una proporción en una población finita, utilizamos la siguiente fórmula:</p>
  <p>$$n = \\frac{N \\cdot Z^2 \\cdot p \\cdot (1 - p)}{E^2 \\cdot (N - 1) + Z^2 \\cdot p \\cdot (1 - p)}$$</p>
  <p>donde:</p>
  <ul>
    <li><b>n</b>: Tamaño muestral</li>
    <li><b>N</b>: Tamaño total de la población</li>
    <li><b>Z</b>: Valor Z correspondiente al nivel de confianza deseado</li>
    <li><b>p</b>: Proporción esperada de la población</li>
    <li><b>E</b>: Margen de error permitido</li>
  </ul>
  <p><b>Ejemplo:</b> Supongamos que deseamos estimar la proporción de una característica en una población de 1000 individuos, con un nivel de confianza del 95%, una proporción esperada de 0.5 y un margen de error de 0.05. El cálculo sería:</p>
  <p>$$n = \\frac{1000 \\cdot 1.96^2 \\cdot 0.5 \\cdot (1 - 0.5)}{0.05^2 \\cdot (1000 - 1) + 1.96^2 \\cdot 0.5 \\cdot (1 - 0.5)} = 278.69$$</p>
  <p>Redondeando al siguiente número entero, necesitamos un tamaño muestral de 279.</p>
  
  <h4>Cálculo del Tamaño Muestral para la Diferencia entre dos Medias</h4>
  <p>Si deseamos comparar dos medias, utilizamos la siguiente fórmula:</p>
  <p>$$n = \\left( \\frac{Z \\cdot \\sqrt{\\sigma_1^2 + \\sigma_2^2}}{E} \\right)^2$$</p>
  <p>donde:</p>
  <ul>
    <li><b>n</b>: Tamaño muestral</li>
    <li><b>Z</b>: Valor Z correspondiente al nivel de confianza deseado</li>
    <li><b>\\(\\sigma_1\\)</b> y <b>\\(\\sigma_2\\)</b>: Desviaciones estándar de las dos poblaciones</li>
    <li><b>E</b>: Margen de error permitido</li>
  </ul>
  <p><b>Ejemplo:</b> Supongamos que deseamos comparar las medias de dos poblaciones con desviaciones estándar de 10 y 15, un nivel de confianza del 95% y un margen de error de 5. El cálculo sería:</p>
  <p>$$n = \\left( \\frac{1.96 \\cdot \\sqrt{10^2 + 15^2}}{5} \\right)^2 = 43.63$$</p>
  <p>Redondeando al siguiente número entero, necesitamos un tamaño muestral de 44 en cada grupo.</p>
  
  <h4>Casos de Uso</h4>
  <p>La determinación del tamaño muestral es crucial en muchas áreas, incluyendo:</p>
  <ul>
    <li><b>Investigación Médica:</b> Para asegurar que los ensayos clínicos tengan suficiente poder estadístico para detectar diferencias significativas.</li>
    <li><b>Encuestas de Opinión:</b> Para estimar la proporción de una población que tiene una opinión particular con un nivel de precisión deseado.</li>
    <li><b>Control de Calidad:</b> Para determinar el tamaño de las muestras necesarias para verificar que un lote de productos cumple con los estándares de calidad.</li>
  </ul>
')
