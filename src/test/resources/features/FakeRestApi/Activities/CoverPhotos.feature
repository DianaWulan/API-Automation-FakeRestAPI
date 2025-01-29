Feature: Cover Photos

  @coverPhotos
  Scenario Outline:
    Given the basefakerest URL is "https://fakerestapi.azurewebsites.net/api/v1/"
    When I send a <methodeAPI> request to <endpoint> with body <body>
    Then the response status code is 200
    And the response output should contain <key> is <value>

    Examples:
      | methodeAPI | endpoint                   | key    | value         | body                                          |
      | get        | CoverPhotos                | id     |               |                                               |
      | get        | CoverPhotos                | url    | https:        |                                               |
      | post       | CoverPhotos                | id     | 10            | {"id": 10,"idBook": 12,"url": "string"}       |
      | post       | CoverPhotos                | idBook | 12            | {"id": 10,"idBook": 12,"url": "string"}       |
      | get        | CoverPhotos/books/covers/2 | id     | 2             |                                               |
      | get        | CoverPhotos/9              | id     | 9             |                                               |
      | put        | CoverPhotos/9              | id     | 9             | {"id": 9,"idBook": 12,"url": "New URL Books"} |
      | put        | CoverPhotos/9              | url    | New URL Books | {"id": 9,"idBook": 12,"url": "New URL Books"} |
      | delete     | CoverPhotos/19             |        |               |                                               |