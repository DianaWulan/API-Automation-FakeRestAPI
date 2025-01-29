Feature: Authors

  @authors
  Scenario Outline:
    Given the basefakerest URL is "https://fakerestapi.azurewebsites.net/api/v1/"
    When I send a <methodeAPI> request to <endpoint> with body <body>
    Then the response status code is 200
    And the response output should contain <key> is <value>

    Examples:
      | methodeAPI | endpoint                | key       | value        | body                                                           |
      | get        | Authors                 | id        |              |                                                                |
      | get        | Authors                 | idBook    |              |                                                                |
      | post       | Authors                 | id        | 6            | {"id": 6,"idBook": 6,"firstName": "Diana","lastName": "Wulan"} |
      | post       | Authors                 | firstName | Diana        | {"id": 6,"idBook": 6,"firstName": "Diana","lastName": "Wulan"} |
      | get        | Authors/authors/books/1 | id        | 1            |                                                                |
      | get        | Authors/authors/books/1 | firstName | First Name 1 |                                                                |
      | get        | Authors/5               | id        | 5            |                                                                |
      | get        | Authors/5               | firstName | First Name 5 |                                                                |
      | put        | Authors/3               | id        | 3            | {"id": 3,"idBook": 0,"firstName": "Nana","lastName": "Wulan"}  |
      | put        | Authors/3               | firstName | Nana         | {"id": 3,"idBook": 0,"firstName": "Nana","lastName": "Wulan"}  |
      | delete     | Authors/3               |           |              |                                                                |
