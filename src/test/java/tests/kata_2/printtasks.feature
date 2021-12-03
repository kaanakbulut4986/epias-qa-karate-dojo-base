Feature: print task for external files

  Scenario: print json file
    * def myVar = read('classpath:tests/data/data.json')
    * set myVar.name = 'newName'

  Scenario Outline: print table variables
    * print <id>, name
    Examples:
      | id  |name|
      | 250 |abc |
      | 251 |def |
      | 252 |efd |






