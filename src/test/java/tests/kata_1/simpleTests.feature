Feature: simple tests

  Scenario: print hello world
    * print 'Hello World'
    * karate.log('hello world')
    * def myVar = 10
    * print myVar
    * print baseUrl

    Scenario: print Json
      * def myJson =
      """
      {
        'id': 10,
        'name': 'myName',
        'adress': 'myAdress'
      }
      """
      * def mySecondJson = { 'id': 10}
      * print myJson
      * print mySecondJson