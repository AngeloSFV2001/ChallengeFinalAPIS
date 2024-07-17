Feature: Inicio de sesion
  Background:
    * def urlPagina = 'https://www.demoblaze.com/'
    * def apiBase = 'https://api.demoblaze.com'
    * def apiSign = '/signup'
    * def apiLog = '/login'
    * def data = read('classpath:ArchivoEntrada/credenciales.json')
    * def usoCredenciales = data.Credenciales

  Scenario: Comprobar si hay servicio
    Given url urlPagina
    When method get
    Then status 200

  Scenario Outline: Signup con nuevo usuario
    Given url apiBase + apiSign
    And request usoCredenciales[<INDEX>]
    When method post
    Then status <STATUS_CODE>
    And print response
    And match response contains "<MESSAGE>"
    #Observaciones
    #1. La respuesta deberia contener alguna notificación en caso de crear exitosamente.
    #2. deberia tener validador de caracteres de contraseña, tanto por su tamaño que por su contenido
  Examples:
    | INDEX| STATUS_CODE |MESSAGE|
    | 0    | 200|        |
    | 1   | 500|Internal Server Error|

  Scenario: Signup usuario existente
    Given url apiBase + apiSign
    And request usoCredenciales[2]
    When method post
    Then status 200
    And match response == {"errorMessage":"This user already exist."}

  Scenario: Login con credenciales exitosas
    Given url apiBase + apiLog
    And request usoCredenciales[3]
    When method post
    Then status 200
    And print response
    And match response contains 'Auth_token:'

  Scenario: Login con usuario invalida
    Given url apiBase + apiLog
    And request usoCredenciales[4]
    When method post
    Then status 200
    And print response
    And match response == {"errorMessage":"User does not exist."}

  Scenario: Login con contraseña invalida
    Given url apiBase + apiLog
    And request usoCredenciales[5]
    When method post
    Then status 200
    And print response
    And match response == {"errorMessage": "Wrong password."}

  Scenario: Login con campos vacios
    Given url apiBase + apiLog
    And request usoCredenciales[6]
    When method post
    Then status 500
    And print response
    And match response contains "Internal Server Error"
