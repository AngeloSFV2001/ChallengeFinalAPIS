# ChallengeFinalAPIS
1. Prerequisitos:
   - Maquina local con el sistema operativo Windows 10 o 11
   - IntelliJ IDEA 2024.1.4.
   - SDK 17 Oracle OpenJDK 17.0.6 
   - Maven 3.9.8
   - Plugins plugins: 
       - Cucumber for java (version 241.14494.158)
       - Gherkin (version 241.17011.40)
       Nota: proceso de instalacion de plugins en IntelliJ File -> Settings -> Plugins -> Buscar en Marketplace
   - Configurar las variables de entorno del sistema y de usuario
     - Agregar nuevas variables de sistemas con su valor 
       - JAVA_HOME : ruta de instalación (ejm. C:\Users\USUARIO\.jdks\azul-1.8.0_412)
       - M2_HOME : ruta de instalación (ejm. C:\Programas\apache-maven-3.9.8)
     - Edita el PATH de las variables de sistema y añade las siguientes variables 
       - %JAVA_HOME%\bin
       - %M2_HOME%\bin
2. Comandos de instalación
   - utilizamos el siguiente comando para actualizar las dependencias de maven: "mvn -U dependency:resolve"
     - nota: En caso de que no se actualice, realizar de forma manual con el boton refrescar en la barra lateral de maven
3. Instrucciones para ejecutar los test
   - para ejecutar los test nos trasladamos a la feature Login que se encuentra en src -> test -> resources
     - Podemos ejecutar todo el feature con todos los escenarios o individualmente. Los escenarios disponibles son:
       - Signup con nuevo usuario
       - Signup usuario existente
       - Login con credenciales exitosas
       - Login con usuario invalida
       - Login con contraseña invalida
       - Login con campos vacios
4. Información adicional
   - Se puede ver los reportes en la carpeta target a través de un explorador.Tambien, al momento de ejecutar el test 
  se crea un link que lleva a un reporte mas amigable para su entendimiento
  
