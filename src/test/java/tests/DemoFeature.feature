Feature: My demo feature for bootcamp


  Scenario: my first scenario
    Given url 'https://petstore.swagger.io/v2'
    And path 'pet', 251
    When method GET
    Then print response