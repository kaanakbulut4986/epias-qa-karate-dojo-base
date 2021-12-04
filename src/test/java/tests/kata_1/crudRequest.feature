Feature: crud requests

  Background:
    Given url baseUrl

  Scenario: get request with url
    * url 'https://petstore.swagger.io/v2/pet/250'
    * method GET
    * print response

  Scenario: get request with url and match
    * url 'https://petstore.swagger.io/v2/pet/250'
    * method GET
    * status 200
    * match response.id == 250
    * match response.name == '#string'
    * match response.status == '#present'

  Scenario: new scenario with header match
    Given url 'https://petstore.swagger.io/v2'
    And path 'pet', 250
    When method GET
    Then status 200
    And match response.id == 250
    And match responseHeaders['Content-Type'][0] == 'application/json'
    And print responseHeaders


  Scenario: query params
    Given path 'pet', 'findByStatus'
    And param status = 'available'
    When method GET
    Then print response


  Scenario: match for every element in response
    Given path 'pet', 'findByStatus'
    And param status = 'pending'
    When method GET
    Then print response
    And match each response[*].status == 'pending'
    And match each response[*].tags[*].id == '#number'


  Scenario: post request with json
    Given path 'pet'
    And def myBody =
    """
    {
  "id": 0,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
    """
    And request myBody
    When method POST
    Then status 200
    And print response

  Scenario: put request and set
    Given path 'pet'
    And def myBody =
    """
    {
  "id": 250,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
    """
    * set myBody.name = 'new_name'
    * request myBody
    * method PUT
    * status 200
    * match response == myBody

    Scenario: delete scenario
      * path 'pet', 258
      When method DELETE
      Then print response
      And status 200

   Scenario: print data json
     * def myVar = read('classpath:tests/data/data.json')
     * print myVar


   Scenario Outline: reading csv file - <id>
     * path 'pet', id
     * method GET
     * match responseStatus == <status>
     * print '<name>'
     Examples:
     |read('classpath:tests/data/data.csv')|











