Feature: Users

  @users
  Scenario Outline:
    Given the basefakerest URL is "https://fakerestapi.azurewebsites.net/api/v1/"
    When I send a <methodeAPI> request to <endpoint> with body <body>
    Then the response status code is 200
    And the response output should contain <key> is <value>

    Examples:
      | methodeAPI | endpoint | key      | value  | body                                                 |
      | get        | Users    | id       |        |                                                      |
      | get        | Users    | userName | User   |                                                      |
      | post       | Users    | id       | 5      | {"id": 5,"userName": "Admin","password": "admin123"} |
      | post       | Users    | userName | Admin  | {"id": 5,"userName": "Admin","password": "admin123"} |
      | get        | Users/2  | id       | 2      |                                                      |
      | get        | Users/2  | userName | User 2 |                                                      |
      | put        | Users/5  | id       | 5      | {"id": 5,"userName": "Nana","password": "nana123"}   |
      | put        | Users/5  | userName | Nana   | {"id": 5,"userName": "Nana","password": "nana123"}   |
      | delete     | Users/5  |          |        |                                                      |