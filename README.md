# ChallengeFinalAPIS
## Prerrequisitos

- Máquina local con el sistema operativo Windows 10 o 11
- [IntelliJ IDEA](https://www.jetbrains.com/es-es/idea/download/) 2024.1.4
- [SDK 17](https://www.oracle.com/java/technologies/downloads/) Oracle OpenJDK 17.0.6
- [Maven](https://maven.apache.org/download.cgi) 3.9.8
- Plugins:
    - Cucumber for Java (versión 241.14494.158)
    - Gherkin (versión 241.17011.40)

**Nota:** Proceso de instalación de plugins en IntelliJ:
- `File -> Settings -> Plugins -> Buscar en Marketplace`

- Configurar las variables de entorno del sistema y de usuario:
    - Agregar nuevas variables de sistemas con su valor:
        - `JAVA_HOME`: ruta de instalación (ejemplo: `C:\Users\USUARIO\.jdks\azul-1.8.0_412`)
        - `M2_HOME`: ruta de instalación (ejemplo: `C:\Programas\apache-maven-3.9.8`)
    - Editar el `PATH` de las variables de sistema y añadir las siguientes variables:
        - `%JAVA_HOME%\bin`
        - `%M2_HOME%\bin`

## Comandos de instalación

Utilizamos el siguiente comando para actualizar y agregar las dependencias de Maven:
```bash
mvn -U dependency:resolve
```
**Nota:** En caso de que no se actualice, realizar de forma manual con el botón refrescar en la barra lateral de Maven.

## Instrucciones para ejecutar los test

- Para ejecutar los test nos trasladamos a la clase `ManagemenTest` que se encuentra en `src/test/java/users/ManagemenTest.java` .
- Al ejecutar la funcion `ManagemenTest`los test se haran en paralelo. En caso de error de servidor modificar
la linea 24 el parametro `.parallel(#)` a número inferior
- Tambien, se puede utilizar las teclas `Mayús + F10` considerando que ya esta configurado como clase de ejecucion
la función `ManagemenTest`
### Modificar parametros de las pruebas
- Teniendo en cuenta los siguientes escenarios y que los datos se ingresan desde un archivo JSON `credenciales.json`
ubicado en el directorio `src/test/resources/ArchivoEntrada/credenciales.json`, se pueden modificar los parametros de entrada segun el
siguiente orden:
    - 1.- Signup con nuevo usuario 
    - 2.- Signup con parametros vacios 
    - 3.-Signup usuario existente 
    - 4.-Login con credenciales exitosas
    - 5.-Login con usuario inválido
    - 6.-Login con contraseña inválida 
    - 7.-Login con campos vacíos
## Visualizacion del reporte
- Para ver los reportes nos trasladamos al directorio `target/cucumber-html-report` y hacemos click derecho en el
archivo `report-feature-#identificador.html`, luego, `Open in -> Browser` y elegimos nuestro navegador de preferencia.
Ahi se podra ver el reporte más reciente de la ejecución
- Tambien, se puede visualizar aplicando el mismo metodo, yendo al directorio `target/karate-reports` y de la misma 
forma abrimos con un navegador el archivo `features.Login.html`. De igual forma se podra ver un reporte de la ejecucion.
- 