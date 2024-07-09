# src/tabs/ui_ayuda.R

ui_ayuda <- fluidRow(box(
  title = "Ayuda",
  status = "primary",
  solidHeader = TRUE,
  width = 12,
  withMathJax(
    HTML(
      '<h3>Cómo Usar la Aplicación</h3>
          <p>Para usar esta aplicación, siga los siguientes pasos:</p>
          <ol>
            <li>Seleccione el Tipo de Muestreo:</li>
            <ul>
            <li>Muestreo Aleatorio Simple (M.A.S.).</li>
            <li>Muestreo Aleatorio con Reposición (M.A.C.R.).</li>
            </ul>
            <li>Introduzca el Tamaño de la Población (solo para M.A.S.)</li>
            <li>Seleccione el Parámetro de Interés:</li>
            <ul>
            <li>Media Poblacional.</li>
            <li>Proporción Poblacional.</li>
            </ul>
            <li>Introduzca los valores de los parámetros necesarios:</li>
            <ul>
            <li>Varianza Poblacional (para medias).</li>
            <li>Estimación Conocida de la Proporción (para proporciones).</li>
            </ul>
            <li>Seleccione la Precisión de la Estimación:</li>
            <ul>
            <li>Error de Muestreo.</li>
            <li>Error Máximo Admisible con Coeficiente de Confianza Fijado.</li>
            </ul>
            <li>Introduzca los valores adicionales:</li>
            <ul>
            <li>Error de Muestreo o Error Máximo Admisible.</li>
            <li>Nivel de Confianza (si aplica).</li>
            </ul>
            <li>Calcule el tamaño de muestra:</li>
            <ul>
            <li>Haga clic en el botón "Calcular" para obtener el tamaño muestral requerido.</li>
            </ul>
          </ol>

          <hr/>

          <h3>Cálculo del Tamaño Muestral necesario para estimar la Media de una población con Varianza Conocida \\(\\sigma^2\\)</h3>
          <p>Para calcular el tamaño muestral necesario para estimar una media poblacional se utilizan las siguientes fórmulas:</p>
          <ul>
            <li>Con un error de muestreo fijado \\(e\\):</li>
              <ul>
                <li>Con un Muestreo Aleatorio con Reposición (M.A.C.R.):</li>
                  <p>$$n_0 = \\frac{\\sigma^2}{e^2}$$</p>
                <li>Con un Muestreo Aleatorio Simple (M.A.S.) sobre una población de \\(N\\) individuos:</li>
                  <p>$$n = \\frac{n_0}{1+\\frac{n_0}{N}}$$</p>
              </ul>
            <li>Con un error máximo admisible \\(e_\\alpha\\) y un nivel de confianza \\(1-\\alpha\\) fijados:</li>
              <ul>
                <li>Con un Muestreo Aleatorio con Reposición (M.A.C.R.):</li>
                  <p>Primero se calculan los valores dados por la aproximación normal y la desigualdad de Tchebychev:</p>
                  <p>$$n_{01} = \\frac{z^2_{1-\\alpha/2} \\cdot\\sigma^2}{e^2_\\alpha},$$ siendo \\(z^2_{1-\\alpha/2}\\) el cuantil de orden \\(1-\\alpha/2\\) de la distribución normal estándar.</p>
                  <p>$$n_{02} = \\frac{\\sigma^2}{\\alpha \\cdot e^2_\\alpha}$$</p>
                  <p>Entonces el tamaño muestral requerido viene dado por:</p>
                  <p>$$n = \\begin{cases}n_{01} & \\text{si } n_{01}\\geq 30 \\\\ \\min\\{30, n_{02}\\} & \\text{en otro caso.}\\end{cases}$$</p>
                <li>Con un Muestreo Aleatorio Simple (M.A.S.) sobre una población de \\(N\\) individuos:</li>
                  <p>Primero se calculan los valores dados por la aproximación normal y la desigualdad de Tchebychev:</p>
                  <p>$$n_1 = \\frac{n_{01}}{1+\\frac{n_{01}}{N}}$$</p>
                  <p>$$n_2 = \\frac{n_{02}}{1+\\frac{n_{02}}{N}}$$</p>
                  <p>Entonces el tamaño muestral requerido viene dado por:</p>
                  <p>$$n = \\begin{cases}n_{1} & \\text{si } n_{1}\\geq 100 \\\\ \\min\\{100, n_{2}\\} & \\text{en otro caso.}\\end{cases}$$</p>
              </ul>
          </ul>
          <p>En todos los casos, el tamaño muestral definitivo se ajusta al número entero más próximo por exceso.</p>

          <hr/>

          <h3>Cálculo del Tamaño Muestral necesario para estimar la Proporción de una población a partir de una Estimación Conocida \\(P\\)</h3>
          <p>Para calcular el tamaño muestral necesario para estimar una proporción poblacional se utilizan las siguientes fórmulas:</p>
          <ul>
            <li>Con un error de muestreo fijado \\(e\\):</li>
              <ul>
                <li>Con un Muestreo Aleatorio con Reposición (M.A.C.R.):</li>
                  <p>$$n_0 = \\frac{P(1-P)}{e^2}$$</p>
                <li>Con un Muestreo Aleatorio Simple (M.A.S.) sobre una población de \\(N\\) individuos:</li>
                  <p>$$n = \\frac{n_0}{1+\\frac{n_{0}-1}{N}}$$</p>
              </ul>
            <li>Con un error máximo admisible \\(e_\\alpha\\) y un nivel de confianza \\(1-\\alpha\\) fijados:</li>
              <ul>
                <li>Con un Muestreo Aleatorio con Reposición (M.A.C.R.):</li>
                  <p>Primero se calculan los valores dados por la aproximación normal y la desigualdad de Tchebychev:</p>
                  <p>$$n_{01} = \\frac{z^2_{1-\\alpha/2} \\cdot P(1-P)}{e^2_\\alpha},$$ siendo \\(z^2_{1-\\alpha/2}\\) el cuantil de orden \\(1-\\alpha/2\\) de la distribución normal estándar.</p>
                  <p>$$n_{02} = \\frac{P(1-P)}{\\alpha \\cdot e^2_\\alpha}$$</p>
                  <p>Entonces el tamaño muestral requerido viene dado por:</p>
                  <p>$$n = \\begin{cases}n_{01} & \\text{si } n_{01}\\geq 30 \\\\ \\min\\{30, n_{02}\\} & \\text{en otro caso.}\\end{cases}$$</p>
                <li>Con un Muestreo Aleatorio Simple (M.A.S.) sobre una población de \\(N\\) individuos:</li>
                  <p>Primero se calculan los valores dados por la aproximación normal y la desigualdad de Tchebychev:</p>
                  <p>$$n_1 = \\frac{n_{01}}{1+\\frac{n_{01}-1}{N}}$$</p>
                  <p>$$n_2 = \\frac{n_{02}}{1+\\frac{n_{02}-1}{N}}$$</p>
                  <p>Entonces el tamaño muestral requerido viene dado por:</p>
                  <p>$$n = \\begin{cases}n_{1} & \\text{si } N\\geq 60 \\text{ y } n_1/N \\leq 0.1 \\\\ \\min\\{100, n_{2}\\} & \\text{en otro caso.}\\end{cases}$$</p>
              </ul>
          </ul>
      <p>En todos los casos, el tamaño muestral definitivo se ajusta al número entero más próximo por exceso.</p>'
    )
  )
))
