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
          <li>Seleccione el Tipo de Muestreo:</li>
          <ul>
            <li>Muestreo Aleatorio Simple (M.A.S)</li>
            <li>Muestreo Aleatorio con Reposición (M.A.C.R)</li>
          </ul>
          <li>Seleccione el Parámetro de Interés:</li>
          <ul>
            <li>Media Poblacional</li>
            <li>Proporción Poblacional</li>
          </ul>
          <li>Ingrese los Valores de los Parámetros Necesarios:</li>
          <ul>
            <li>Varianza Poblacional (para medias)</li>
            <li>Estimación Conocida de la Proporción (para proporciones)</li>
          </ul>
          <li>Seleccione la Precisión de la Estimación:</li>
          <ul>
            <li>Error de Muestreo</li>
            <li>Error Máximo Admisible con Coeficiente de Confianza Fijado</li>
          </ul>
          <li>Ingrese los Valores Adicionales:</li>
          <ul>
            <li>Tamaño de la Población (solo para M.A.S)</li>
            <li>Error de Muestreo o Error Máximo Admisible</li>
            <li>Nivel de Confianza (si aplica)</li>
          </ul>
          <li>Calcular:</li>
          <ul>
            <li>Haga clic en el botón "Calcular" para obtener el tamaño muestral requerido.</li>
          </ul>
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
      '))
  )
)
