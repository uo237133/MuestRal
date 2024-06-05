# help_text.R

help_content <- HTML('
  <h3>Ayuda: Tama&ntilde;o Muestral</h3>
  
  <p>El tama&ntilde;o muestral es el n&uacute;mero de observaciones o replicaciones que se incluyen en un estudio. Es importante para asegurar que los resultados del estudio sean estad&iacute;sticamente significativos y representativos de la poblaci&oacute;n.</p>
  
  <h4>C&aacute;lculo del Tama&ntilde;o Muestral para Estimar una Media</h4>
  <p>Para estimar una media poblacional, utilizamos la siguiente f&oacute;rmula:</p>
  <p>$$n = \\left( \\frac{Z \\cdot \\sigma}{E} \\right)^2$$</p>
  <p>donde:</p>
  <ul>
    <li><b>n</b>: Tama&ntilde;o muestral</li>
    <li><b>Z</b>: Valor Z correspondiente al nivel de confianza deseado (por ejemplo, 1.96 para un 95% de confianza)</li>
    <li><b>\\(\\sigma\\)</b>: Desviaci&oacute;n est&aacute;ndar de la poblaci&oacute;n</li>
    <li><b>E</b>: Margen de error permitido</li>
  </ul>
  <p><b>Ejemplo:</b> Supongamos que deseamos estimar la media de una poblaci&oacute;n con una desviaci&oacute;n est&aacute;ndar de 10, un nivel de confianza del 95% y un margen de error de 2. El c&aacute;lculo ser&iacute;a:</p>
  <p>$$n = \\left( \\frac{1.96 \\cdot 10}{2} \\right)^2 = 96.04$$</p>
  <p>Redondeando al siguiente n&uacute;mero entero, necesitamos un tama&ntilde;o muestral de 97.</p>
  
  <h4>C&aacute;lculo del Tama&ntilde;o Muestral para Estimar una Proporci&oacute;n (con reposici&oacute;n)</h4>
  <p>Para estimar una proporci&oacute;n poblacional, utilizamos la siguiente f&oacute;rmula:</p>
  <p>$$n = \\frac{Z^2 \\cdot p \\cdot (1 - p)}{E^2}$$</p>
  <p>donde:</p>
  <ul>
    <li><b>n</b>: Tama&ntilde;o muestral</li>
    <li><b>Z</b>: Valor Z correspondiente al nivel de confianza deseado</li>
    <li><b>p</b>: Proporci&oacute;n esperada de la poblaci&oacute;n</li>
    <li><b>E</b>: Margen de error permitido</li>
  </ul>
  <p><b>Ejemplo:</b> Supongamos que deseamos estimar la proporci&oacute;n de una caracter&iacute;stica con un nivel de confianza del 95%, una proporci&oacute;n esperada de 0.5 y un margen de error de 0.05. El c&aacute;lculo ser&iacute;a:</p>
  <p>$$n = \\frac{1.96^2 \\cdot 0.5 \\cdot (1 - 0.5)}{0.05^2} = 384.16$$</p>
  <p>Redondeando al siguiente n&uacute;mero entero, necesitamos un tama&ntilde;o muestral de 385.</p>
  
  <h4>C&aacute;lculo del Tama&ntilde;o Muestral para Estimar una Proporci&oacute;n (sin reposici&oacute;n)</h4>
  <p>Para estimar una proporci&oacute;n en una poblaci&oacute;n finita, utilizamos la siguiente f&oacute;rmula:</p>
  <p>$$n = \\frac{N \\cdot Z^2 \\cdot p \\cdot (1 - p)}{E^2 \\cdot (N - 1) + Z^2 \\cdot p \\cdot (1 - p)}$$</p>
  <p>donde:</p>
  <ul>
    <li><b>n</b>: Tama&ntilde;o muestral</li>
    <li><b>N</b>: Tama&ntilde;o total de la poblaci&oacute;n</li>
    <li><b>Z</b>: Valor Z correspondiente al nivel de confianza deseado</li>
    <li><b>p</b>: Proporci&oacute;n esperada de la poblaci&oacute;n</li>
    <li><b>E</b>: Margen de error permitido</li>
  </ul>
  <p><b>Ejemplo:</b> Supongamos que deseamos estimar la proporci&oacute;n de una caracter&iacute;stica en una poblaci&oacute;n de 1000 individuos, con un nivel de confianza del 95%, una proporci&oacute;n esperada de 0.5 y un margen de error de 0.05. El c&aacute;lculo ser&iacute;a:</p>
  <p>$$n = \\frac{1000 \\cdot 1.96^2 \\cdot 0.5 \\cdot (1 - 0.5)}{0.05^2 \\cdot (1000 - 1) + 1.96^2 \\cdot 0.5 \\cdot (1 - 0.5)} = 278.69$$</p>
  <p>Redondeando al siguiente n&uacute;mero entero, necesitamos un tama&ntilde;o muestral de 279.</p>
  
  <h4>C&aacute;lculo del Tama&ntilde;o Muestral para la Diferencia entre dos Medias</h4>
  <p>Si deseamos comparar dos medias, utilizamos la siguiente f&oacute;rmula:</p>
  <p>$$n = \\left( \\frac{Z \\cdot \\sqrt{\\sigma_1^2 + \\sigma_2^2}}{E} \\right)^2$$</p>
  <p>donde:</p>
  <ul>
    <li><b>n</b>: Tama&ntilde;o muestral</li>
    <li><b>Z</b>: Valor Z correspondiente al nivel de confianza deseado</li>
    <li><b>\\(\\sigma_1\\)</b> y <b>\\(\\sigma_2\\)</b>: Desviaciones est&aacute;ndar de las dos poblaciones</li>
    <li><b>E</b>: Margen de error permitido</li>
  </ul>
  <p><b>Ejemplo:</b> Supongamos que deseamos comparar las medias de dos poblaciones con desviaciones est&aacute;ndar de 10 y 15, un nivel de confianza del 95% y un margen de error de 5. El c&aacute;lculo ser&iacute;a:</p>
  <p>$$n = \\left( \\frac{1.96 \\cdot \\sqrt{10^2 + 15^2}}{5} \\right)^2 = 43.63$$</p>
  <p>Redondeando al siguiente n&uacute;mero entero, necesitamos un tama&ntilde;o muestral de 44 en cada grupo.</p>
  
  <h4>Casos de Uso</h4>
  <p>La determinaci&oacute;n del tama&ntilde;o muestral es crucial en muchas &aacute;reas, incluyendo:</p>
  <ul>
    <li><b>Investigaci&oacute;n M&eacute;dica:</b> Para asegurar que los ensayos cl&iacute;nicos tengan suficiente poder estad&iacute;stico para detectar diferencias significativas.</li>
    <li><b>Encuestas de Opini&oacute;n:</b> Para estimar la proporci&oacute;n de una poblaci&oacute;n que tiene una opini&oacute;n particular con un nivel de precisi&oacute;n deseado.</li>
    <li><b>Control de Calidad:</b> Para determinar el tama&ntilde;o de las muestras necesarias para verificar que un lote de productos cumple con los est&aacute;ndares de calidad.</li>
  </ul>
')

