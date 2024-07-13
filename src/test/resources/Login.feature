Feature: Inicio de sesion
  Background:
    * def urlPagina = 'https://www.demoblaze.com/'
    * def apiBase = 'https://api.demoblaze.com'
    * def apiSign = '/signup'
    * def apiLog = '/login'

  Scenario: Comprobar si hay servicio
    Given url urlPagina
    When method get
    Then status 200

  Scenario Outline: Signup con nuevo usuario
    Given url apiBase + apiSign
    And request
  """{
  "username": "<USER>",
  "password": "<PASSWORD>" }
  """
    When method post
    Then status <STATUS_CODE>
    And print response
    And match response contains "<MESSAGE>"
    #Observaciones
    #1. La respuesta deberia contener alguna notificación en caso de crear exitosamente.
    #2. deberia tener validador de caracteres de contraseña, tanto por su tamaño que por su contenido
  Examples:
    | USER | PASSWORD | STATUS_CODE |MESSAGE|
    |User_prueba13|User_prueba13| 200| |
    |              |              | 500|Internal Server Error|

  Scenario: Signup usuario existente
    Given url apiBase + apiSign
    And request
  """{
  "username": "User_prueba1",
  "password": "User_prueba1" }
  """
    When method post
    Then status 200
    And match response == {"errorMessage":"This user already exist."}

  Scenario: Login con credenciales exitosas
    Given url apiBase + apiLog
    And request
  """{
  "username": "User_prueba1",
  "password": "User_prueba1" }
  """
    When method post
    Then status 200
    And print response
    And match response != {"errorMessage": "Wrong password."}
    #La respuesta de este proceso tiene inconsistencias, se puede deber que al crear la cuenta esta registra
      # otro contraseña o que tiene un mensaje erronio, pero haciendo pruebas de usabilidad se tiene que
      # si se accede con estas credenciales

  Scenario: Login con usuario invalida
    Given url apiBase + apiLog
    And request
  """{
  "username": "User_prueba33",
  "password": "User_prueba2" }
  """
    When method post
    Then status 200
    And print response
    And match response == {"errorMessage":"User does not exist."}

  Scenario: Login con contraseña invalida
    Given url apiBase + apiLog
    And request
  """{
  "username": "User_prueba1",
  "password": "User_prueba2" }
  """
    When method post
    Then status 200
    And print response
    And match response == {"errorMessage": "Wrong password."}

  Scenario: Login con campos vacios
    Given url apiBase + apiLog
    And request
  """{
  "username": "",
  "password": "" }
  """
    When method post
    Then status 500
    And print response
    And match response contains "Internal Server Error"
