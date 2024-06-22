# MuestRal

MuestRal es una aplicación Shiny diseñada para calcular tamaños muestrales de manera eficiente y precisa.  
Esta herramienta es ideal para investigadores, estadísticos y cualquier persona interesada en calcular tamaños muestrales para estudios de investigación.  
Permite calcular el tamaño muestral necesario para estimar medias y proporciones poblacionales utilizando diferentes metodologías y parámetros.

## Características

- **Cálculo del Tamaño Muestral para Medias y Proporciones**: Calcula el tamaño muestral requerido para estimar medias y proporciones poblacionales.
- **Métodos de Muestreo**: Soporta Muestreo Aleatorio Simple (M.A.S) y Muestreo Aleatorio con Reposición (M.A.C.R).
- **Precisión de la Estimación**: Permite seleccionar entre Error de Muestreo y Error Máximo Admisible con Coeficiente de Confianza Fijado.
- **Interfaz Intuitiva**: Interfaz moderna y fácil de usar, con tooltips para facilitar la comprensión de cada parámetro.
- **Ayuda y Ejemplos**: Sección de ayuda detallada con ejemplos y explicaciones de cada cálculo.

## Requisitos del Sistema

- R (versión 4.0.0 o superior)
- RStudio (recomendado)
- Paquetes de R necesarios:
  - shiny
  - shinydashboard
  - shinyFeedback
  - shinyBS

## Instalación

### Clonar el Repositorio

Primero, clona el repositorio en tu máquina local:

```sh
git clone https://github.com/uo237133/MuestRal.git
cd MuestRal
```

### Instalar los Paquetes Necesarios

Abre R o RStudio y ejecuta el siguiente código para instalar los paquetes necesarios:

```r
install.packages(c("shiny", "shinydashboard", "shinyFeedback", "shinyBS"))
```

## Ejecución de la Aplicación

Una vez instalados los paquetes necesarios, puedes ejecutar la aplicación desde RStudio o desde la consola de R:

```r
# Cargar y ejecutar la aplicación

shiny::runApp("path/to/MuestRal")

# Reemplaza "path/to/MuestRal" con la ruta al directorio donde clonaste el repositorio.
```

## Uso de la Aplicación

### Instrucciones de Uso

1. **Seleccione el Tipo de Muestreo**:
   - Muestreo Aleatorio Simple (M.A.S)
   - Muestreo Aleatorio con Reposición (M.A.C.R)

2. **Seleccione el Parámetro de Interés**:
   - Media Poblacional
   - Proporción Poblacional

3. **Ingrese los Valores de los Parámetros Necesarios**:
   - Varianza Poblacional (para medias)
   - Estimación Conocida de la Proporción (para proporciones)

4. **Seleccione la Precisión de la Estimación**:
   - Error de Muestreo
   - Error Máximo Admisible con Coeficiente de Confianza Fijado

5. **Ingrese los Valores Adicionales**:
   - Tamaño de la Población (solo para M.A.S)
   - Error de Muestreo o Error Máximo Admisible
   - Nivel de Confianza (si aplica)

6. **Calcular**:
   - Haga clic en el botón "Calcular" para obtener el tamaño muestral requerido.

### Ejemplos de Uso

- **Estimación de una Media**: Supongamos que queremos estimar la media de una población con una varianza poblacional de 25, un nivel de confianza del 95% y un margen de error de 5. 
- **Estimación de una Proporción**: Supongamos que queremos estimar la proporción de una población con una proporción esperada de 0.5, un nivel de confianza del 95% y un margen de error de 0.05.

## Ayuda y Soporte

Si necesitas ayuda o tienes preguntas sobre el uso de la aplicación, consulta la sección de ayuda integrada en la aplicación. Para acceder a la ayuda:

1. Abre la aplicación MuestRal.
2. Navega a la pestaña "Ayuda" en el menú de la izquierda.

En esta sección encontrarás:

- **Instrucciones de Uso**: Pasos detallados sobre cómo usar la aplicación.
- **Cálculo del Tamaño Muestral**: Explicaciones y fórmulas utilizadas para calcular el tamaño muestral para medias y proporciones.
- **Ejemplos de Cálculo**: Ejemplos detallados para entender mejor cómo funcionan los cálculos.

Para más información o soporte adicional, puedes contactar al desarrollador:
- Correo electrónico: [UO237133@uniovi.es](mailto:UO237133@uniovi.es)
- Repositorio de GitHub: [https://github.com/uo237133/MuestRal](https://github.com/uo237133/MuestRal)

## Contribuciones

¡Las contribuciones son bienvenidas! Si deseas contribuir a este proyecto, sigue estos pasos:

1. **Fork el Repositorio**: Haz clic en el botón "Fork" en la esquina superior derecha de la página del repositorio.
2. **Clonar tu Fork**: Clona tu fork a tu máquina local.
```sh
git clone https://github.com/tu-usuario/MuestRal.git
cd MuestRal
```
3. **Crear una Rama**: Crea una nueva rama para tu contribución.
```sh
git checkout -b feature/nueva-caracteristica
```
4. **Realizar Cambios**: Realiza los cambios necesarios en el código.
5. **Commit tus Cambios**: Commit tus cambios con un mensaje descriptivo.
```sh
git commit -m "Añadir nueva característica"
```
6. **Push a tu Fork**: Push tus cambios a tu fork en GitHub.
```sh
git push origin feature/nueva-caracteristica
```
7. **Abrir un Pull Request**: Abre un Pull Request en el repositorio original y describe los cambios que has realizado.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Para más detalles, consulta el archivo [LICENSE](LICENSE) en el repositorio.

## Agradecimientos

Este proyecto fue desarrollado en colaboración con la Universidad de Oviedo y la Escuela de Ingeniería Informática de Oviedo.

![Universidad de Oviedo](img/universidad_oviedo.png)
![Escuela de Ingeniería Informática de Oviedo](img/ingenieria_informatica_oviedo.png)

