# MuestRal

Aplicación web interactiva para el cálculo del tamaño muestral con Shiny.  
MuestRal es una herramienta diseñada para investigadores, estadísticos y cualquier persona interesada en calcular tamaños muestrales para estudios de investigación.  
Esta aplicación permite calcular el tamaño muestral necesario para estimar medias y proporciones poblacionales utilizando diferentes metodologías y parámetros.

## Características

- **Cálculo del Tamaño Muestral para Medias y Proporciones**: Calcula el tamaño muestral requerido para estimar medias y proporciones poblacionales.
- **Métodos de Muestreo**: Soporta Muestreo Aleatorio Simple (M.A.S.) y Muestreo Aleatorio con Reposición (M.A.C.R.).
- **Precisión de la Estimación**: Permite seleccionar entre Error de Muestreo y Error Máximo Admisible con Coeficiente de Confianza Fijado.
- **Interfaz Intuitiva**: Interfaz moderna y fácil de usar, con tooltips para facilitar la comprensión de cada parámetro.
- **Ayuda**: Sección de ayuda detallada con fórmulas y explicaciones de cada cálculo.

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

shiny::runApp()
```

## Uso de la Aplicación

### Instrucciones de Uso

1. **Seleccione el Tipo de Muestreo**:
   - Muestreo Aleatorio Simple (M.A.S.)
   - Muestreo Aleatorio con Reposición (M.A.C.R.)

2. **Introduzca el Tamaño de la Población (solo para M.A.S.)**

3. **Seleccione el Parámetro de Interés**:
   - Media Poblacional
   - Proporción Poblacional

4. **Introduzca los valores de los parámetros necesarios**:
   - Varianza Poblacional (para medias)
   - Estimación Conocida de la Proporción (para proporciones)

5. **Seleccione la Precisión de la Estimación**:
   - Error de Muestreo
   - Error Máximo Admisible con Coeficiente de Confianza Fijado

6. **Introduzca los valores adicionales**:
   - Error de Muestreo o Error Máximo Admisible
   - Nivel de Confianza (si aplica)

7. **Calcular**:
   - Haga clic en el botón "Calcular" para obtener el tamaño muestral requerido.

## Ayuda y Soporte

Si necesitas ayuda o tienes preguntas sobre el uso de la aplicación, consulta la sección de ayuda integrada en la aplicación. Para acceder a la ayuda:

1. Abre la aplicación MuestRal.
2. Navega a la pestaña "Ayuda" en el menú de la izquierda.

En esta sección encontrarás:

- **Instrucciones de Uso**: Pasos detallados sobre cómo usar la aplicación.
- **Cálculo del Tamaño Muestral**: Explicaciones y fórmulas utilizadas para calcular el tamaño muestral para medias y proporciones.

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

<p align="center">
  <img src="img/universidad_oviedo.png" alt="Universidad de Oviedo" width="300"/>
  <img src="img/ingenieria_informatica_oviedo.png" alt="Escuela de Ingeniería Informática de Oviedo" width="300"/>
</p>

## Referencias

- Pérez López, C. (2005). Muestreo estadístico: conceptos y problemas resueltos.
- [Shiny Documentation - RStudio](https://shiny.rstudio.com/articles/)
- [R Project Documentation](https://cran.r-project.org/manuals.html)