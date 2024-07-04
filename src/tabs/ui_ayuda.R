# src/tabs/ui_ayuda.R

ui_ayuda <- fluidRow(box(
  title = "Ayuda",
  status = "primary",
  solidHeader = TRUE,
  width = 12,
  withMathJax(
    HTML(
      '<h3>Cómo Usar la Aplicación</h3>
          <p>Para usar esta aplicación, simplemente siga los siguientes pasos:</p>
          <ol>
            <li>Seleccione el Tipo de Muestreo:</li>
            <ul>
            <li>Muestreo Aleatorio Simple (M.A.S)</li>
            <li>Muestreo Aleatorio con Reposición (M.A.C.R)</li>
            </ul>
            <li>Ingrese el Tamaño de la Población (solo para M.A.S)</li>
            <li>Seleccione el Parámetro de Interés:</li>
            <ul>
            <li>Media Poblacional</li>
            <li>Proporción Poblacional</li>
            </ul>
            <li>Ingrese los valores de los parámetros necesarios:</li>
            <ul>
            <li>Varianza Poblacional (para medias)</li>
            <li>Estimación Conocida de la Proporción (para proporciones)</li>
            </ul>
            <li>Seleccione la Precisión de la Estimación:</li>
            <ul>
            <li>Error de Muestreo</li>
            <li>Error Máximo Admisible con Coeficiente de Confianza Fijado</li>
            </ul>
            <li>Ingrese los valores adicionales:</li>
            <ul>
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
          <p>Se evalúan dos fórmulas y se selecciona la más apropiada según las condiciones:</p>
          <ul>
            <li>Si el valor de <i>n</i> en la aproximación normal es mayor o igual que 100, entonces:</li>
            <p>$$n_0 = \\frac{Z_{1-\\alpha/2}^2 \\cdot \\sigma^2}{E^2}$$</p>
            <p>$$n = \\frac{N \\cdot n_0}{N + n_0}$$</p>
            <li>En caso contrario, utilizaremos la desigualdad de Tchebychev:</li>
            <p>$$n_0 = \\frac{\\sigma^2}{\\alpha \\cdot E^2}$$</p>
            <p>$$n = \\frac{N \\cdot n_0}{N + n_0}$$</p>
          </ul>

          <h4>Muestreo Aleatorio con Reposición (M.A.C.R) con Varianza Poblacional</h4>
          <p>Para un error de muestreo específico:</p>
          <p>$$n = \\frac{\\sigma^2}{E^2}$$</p>
          <p>Para un error máximo admisible con un nivel de confianza específico:</p>
          <p>Se evalúan dos fórmulas y se selecciona la más apropiada según las condiciones:</p>
          <ul>
            <li>Si el valor de <i>n</i> en la aproximación normal es mayor o igual que 30, entonces:</li>
            <p>$$n = \\frac{Z_{1-\\alpha/2}^2 \\cdot \\sigma^2}{E^2}$$</p>
            <li>En caso contrario, utilizaremos la desigualdad de Tchebychev:</li>
            <p>$$n = \\frac{\\sigma^2}{\\alpha \\cdot E^2}$$</p>
          </ul>

          <hr/>

          <h3>Cálculo del Tamaño Muestral para Estimar una Proporción</h3>
          <p>Para estimar una proporción poblacional, utilizamos las siguientes fórmulas:</p>

          <h4>Muestreo Aleatorio Simple (M.A.S) con Proporción Poblacional</h4>
          <p>Para un error de muestreo específico:</p>
          <p>$$n = \\frac{N \\cdot p \\cdot (1 - p)}{N \\cdot E^2 + p \\cdot (1 - p)}$$</p>
          <p>Para un error máximo admisible con un nivel de confianza específico:</p>
          <p>Se evalúan dos fórmulas y se selecciona la más apropiada según las condiciones:</p>
          <ul>
            <li>Si secumple que <i>N >= 60</i> y <i>n/N <= 0.1</i> de la aproximación normal:</li>
            <p>$$n_0 = \\frac{Z_{1-\\alpha/2}^2 \\cdot p \\cdot (1 - p)}{E^2}$$</p>
            <p>$$n = \\frac{N \\cdot n_0}{N + n_0}$$</p>
            <li>En caso contrario, utilizaremos la desigualdad de Tchebychev:</li>
            <p>$$n_0 = \\frac{p \\cdot (1 - p)}{\\alpha \\cdot E^2}$$</p>
            <p>$$n = \\frac{N \\cdot n_0}{N + n_0}$$</p>
          </ul>

          <h4>Muestreo Aleatorio con Reposición (M.A.C.R) con Proporción Poblacional</h4>
          <p>Para un error de muestreo específico:</p>
          <p>$$n = \\frac{p \\cdot (1 - p)}{E^2}$$</p>
          <p>Para un error máximo admisible con un nivel de confianza específico:</p>
          <p>Se evalúan dos fórmulas y se selecciona la más apropiada según las condiciones:</p>
          <ul>
            <li>Si el valor de <i>n</i> en la aproximación normal es mayor o igual que 30, entonces:</li>
            <p>$$n = \\frac{Z_{1-\\alpha/2}^2 \\cdot p \\cdot (1 - p)}{E^2}$$</p>
            <li>En caso contrario, utilizaremos la desigualdad de Tchebychev:</li>
            <p>$$n = \\frac{p \\cdot (1 - p)}{\\alpha \\cdot E^2}$$</p>
          </ul>

          <h3>Parámetros</h3>
          <ul>
            <li><b>N:</b> Tamaño de la población (solo para M.A.S).</li>
            <li><b>\\(\\sigma^2\\):</b> Varianza poblacional.</li>
            <li><b>p:</b> Estimación Conocida de la Proporción.</li>
            <li><b>E:</b> Error de muestreo/Error máximo admisible.</li>
            <li><b>\\(\\alpha\\):</b> Nivel de confianza deseado.</li>
            <li><b>\\(Z_{1-\\alpha/2}\\):</b> Valor Z normalizado correspondiente al nivel de confianza deseado.</li>
          </ul>'
    )
  )
))
