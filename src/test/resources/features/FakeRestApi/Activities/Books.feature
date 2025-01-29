Feature: Books

  @books
  Scenario Outline:
    Given the basefakerest URL is "https://fakerestapi.azurewebsites.net/api/v1/"
    When I send a <methodeAPI> request to <endpoint> with body <body>
    Then the response status code is 200
    And the response output should contain <key> is <value>

    Examples:
      | methodeAPI | endpoint | key   | value        | body                                                                                                                                                |
      | get        | Books    | id    |              |                                                                                                                                                     |
      | get        | Books    | title | Book         |                                                                                                                                                     |
      | post       | Books    | id    | 7            | {"id": 7,"title": "Science Book","description": "All About Science","pageCount": 790,"excerpt": "string","publishDate": "2025-01-22T14:01:01.340Z"} |
      | post       | Books    | title | Science Book | {"id": 7,"title": "Science Book","description": "All About Science","pageCount": 790,"excerpt": "string","publishDate": "2025-01-22T14:01:01.340Z"} |
      | get        | Books/10 | id    | 10           |                                                                                                                                                     |
      | put        | Books/12 | id    | 12           | {"id": 12,"title": "New Title","description": "New Description","pageCount": 0,"excerpt": "string","publishDate": "2025-01-22T14:03:49.596Z"}       |
      | put        | Books/12 | title | New Title    | {"id": 12,"title": "New Title","description": "New Description","pageCount": 0,"excerpt": "string","publishDate": "2025-01-22T14:03:49.596Z"}       |
      | delete     | Books/12 |       |              |                                                                                                                                                     |