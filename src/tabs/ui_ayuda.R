# src/tabs/ui_ayuda.R

ui_ayuda <- fluidRow(
    box(
      title = "Ayuda: Tamaño Muestral",
      status = "primary",
      solidHeader = TRUE,
      width = 12,
      withMathJax(HTML(
      '<h3>Cómo Usar la Aplicación</h3>
        <p>Para usar esta aplicación, simplemente siga los siguientes pasos:</p>
        <ol>
          <li>Seleccione el tipo de muestreo.</li>
          <li>Seleccione el parámetro de interés (media o proporción).</li>
          <li>Ingrese los valores de los parámetros necesarios, como la varianza poblacional o la estimación de la proporción.</li>
          <li>Seleccione la precisión de la estimación (error de muestreo o error máximo admisible con coeficiente de confianza fijado).</li>
          <li>Ingrese los valores adicionales necesarios, como el tamaño de la población, el nivel de confianza y el margen de error.</li>
          <li>Haga clic en el botón "Calcular" para obtener el tamaño muestral requerido.</li>
        </ol>
        <hr/>
        <h3>Cálculo del Tamaño Muestral para Estimar una Media</h3>
        <p>Para estimar una media poblacional, utilizamos las siguientes fórmulas:</p>
        
        <h4>Muestreo Aleatorio Simple (M.A.S) con Varianza Poblacional</h4>
        <p>Para un error de muestreo específico:</p>
        <p>$$n = \\frac{N \\cdot \\sigma^2}{N \\cdot E^2 + \\sigma^2}$$</p>
        <p>Para un error máximo admisible con un nivel de confianza específico:</p>
        <p>$$n = \\frac{N \\cdot Z^2 \\cdot \\sigma^2}{N \\cdot E^2 + Z^2 \\cdot \\sigma^2}$$</p>
        
        <h4>Muestreo Aleatorio con Reposición (M.A.C.R) con Varianza Poblacional</h4>
        <p>Para un error de muestreo específico:</p>
        <p>$$n = \\frac{\\sigma^2}{E^2}$$</p>
        <p>Para un error máximo admisible con un nivel de confianza específico:</p>
        <p>$$n = \\frac{Z^2 \\cdot \\sigma^2}{E^2}$$</p>
        
        <h4>Ejemplo de Cálculo para una Media</h4>
        <p>Supongamos que queremos estimar la media de una población con una varianza poblacional de 25, un nivel de confianza del 95% y un margen de error de 5. Usando la fórmula para el error máximo admisible con un nivel de confianza específico en un muestreo aleatorio simple (M.A.S) y una población de 1000, el cálculo sería:</p>
        <p>$$n = \\frac{1000 \\cdot 1.96^2 \\cdot 25}{1000 \\cdot 5^2 + 1.96^2 \\cdot 25} = 24.04$$</p>
        <p>Redondeando al siguiente número entero, necesitamos un tamaño muestral de 25.</p>
        <p>Si la población es infinita, usamos la fórmula para M.A.C.R:</p>
        <p>$$n = \\frac{1.96^2 \\cdot 25}{5^2} = 96.04$$</p>
        <p>Redondeando al siguiente número entero, necesitamos un tamaño muestral de 97.</p>
        <hr/>
        <h3>Cálculo del Tamaño Muestral para Estimar una Proporción</h3>
        <p>Para estimar una proporción poblacional, utilizamos las siguientes fórmulas:</p>
        
        <h4>Muestreo Aleatorio Simple (M.A.S) con Proporción Poblacional</h4>
        <p>Para un error de muestreo específico:</p>
        <p>$$n = \\frac{N \\cdot p \\cdot (1 - p)}{N \\cdot E^2 + p \\cdot (1 - p)}$$</p>
        <p>Para un error máximo admisible con un nivel de confianza específico:</p>
        <p>$$n = \\frac{N \\cdot Z^2 \\cdot p \\cdot (1 - p)}{N \\cdot E^2 + Z^2 \\cdot p \\cdot (1 - p)}$$</p>
        
        <h4>Muestreo Aleatorio con Reposición (M.A.C.R) con Proporción Poblacional</h4>
        <p>Para un error de muestreo específico:</p>
        <p>$$n = \\frac{p \\cdot (1 - p)}{E^2}$$</p>
        <p>Para un error máximo admisible con un nivel de confianza específico:</p>
        <p>$$n = \\frac{Z^2 \\cdot p \\cdot (1 - p)}{E^2}$$</p>
        
        <h4>Ejemplo de Cálculo para una Proporción</h4>
        <p>Supongamos que queremos estimar la proporción de una población con una proporción esperada de 0.5, un nivel de confianza del 95% y un margen de error de 0.05. Usando la fórmula para el error máximo admisible con un nivel de confianza específico en un muestreo aleatorio simple (M.A.S) y una población de 1000, el cálculo sería:</p>
        <p>$$n = \\frac{1000 \\cdot 1.96^2 \\cdot 0.5 \\cdot (1 - 0.5)}{1000 \\cdot 0.05^2 + 1.96^2 \\cdot 0.5 \\cdot (1 - 0.5)} = 278.69$$</p>
        <p>Redondeando al siguiente número entero, necesitamos un tamaño muestral de 279.</p>
        <p>Si la población es infinita, usamos la fórmula para M.A.C.R:</p>
        <p>$$n = \\frac{1.96^2 \\cdot 0.5 \\cdot (1 - 0.5)}{0.05^2} = 384.16$$</p>
        <p>Redondeando al siguiente número entero, necesitamos un tamaño muestral de 385.</p>
        
        <h3>Parámetros</h3>
        <ul>
          <li><b>N:</b> Tamaño de la población (solo para M.A.S).</li>
          <li><b>\\(\\sigma^2\\):</b> Varianza poblacional.</li>
          <li><b>p:</b> Proporción poblacional esperada.</li>
          <li><b>E:</b> Error de muestreo.</li>
          <li><b>Z:</b> Valor Z correspondiente al nivel de confianza deseado.</li>
        </ul>
        
        <h3>Metodologías</h3>
        <p>Existen dos metodologías principales para calcular el tamaño muestral: la aproximación normal y la desigualdad de Tchebychev.</p>
        <ul>
          <li><b>Aproximación Normal:</b> Esta metodología se utiliza cuando el tamaño muestral es grande (n >= 30). Se basa en la suposición de que la distribución de la muestra es normal.</li>
          <li><b>Desigualdad de Tchebychev:</b> Esta metodología se utiliza cuando el tamaño muestral es pequeño o la distribución de la muestra no es normal. No requiere que la distribución de la muestra sea normal y es aplicable para cualquier distribución.</li>
        </ul>
        <hr/>
        <h3>Casos de Uso</h3>
        <p>La determinación del tamaño muestral es crucial en muchas áreas, incluyendo:</p>
        <ul>
          <li><b>Investigación Médica:</b> Para asegurar que los ensayos clínicos tengan suficiente poder estadístico para detectar diferencias significativas.</li>
          <li><b>Encuestas de Opinión:</b> Para estimar la proporción de una población que tiene una opinión particular con un nivel de precisión deseado.</li>
          <li><b>Control de Calidad:</b> Para determinar el tamaño de las muestras necesarias para verificar que un lote de productos cumple con los estándares de calidad.</li>
        </ul>'))
    )
  )
