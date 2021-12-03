Feature: crud requests with external files

  Background:
    Given url baseUrl

  Scenario: post request with external data file
    And path 'pet'
    * def myVar = read('classpath:tests/data/data.json')
    * set myVar.name = 'newJsonName'
    And request myVar
    When method POST
    Then status 200
    And match response.name == myVar.name
    And match response.id == myVar.id
    And match response.status == myVar.status
    And match response == myVar

  Scenario Outline: get request from table
    * path 'pet', id
    When method GET
    Then status 200
    Examples:
      | id  |
      | 250 |
      | 251 |
      | 252 |
      | 253 |









