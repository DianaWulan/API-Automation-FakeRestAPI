Feature: Activities

  @activities
  Scenario Outline:
    Given the basefakerest URL is "https://fakerestapi.azurewebsites.net/api/v1/"
    When I send a <methodeAPI> request to <endpoint> with body <body>
    Then the response status code is 200
    And the response output should contain <key> is <value>

    Examples:
      | methodeAPI | endpoint     | key   | value     | body                                                                                   |
      | get        | Activities   | id    |           |                                                                                        |
      | get        | Activities   | title | Activity  |                                                                                        |
      | get        | Activities/1 | id    | 1         |                                                                                        |
      | post       | Activities   | id    | 2         | {"id": 2,"title": "old title","dueDate": "2025-01-22T08:00:37.267Z","completed": true} |
      | post       | Activities   | title | old title | {"id": 2,"title": "old title","dueDate": "2025-01-22T08:00:37.267Z","completed": true} |
      | put        | Activities/2 | id    | 2         | {"id": 2,"title": "new title","dueDate": "2025-01-22T08:04:55.124Z","completed": true} |
      | put        | Activities/2 | title | new title | {"id": 2,"title": "new title","dueDate": "2025-01-22T08:04:55.124Z","completed": true} |
      | delete     | Activities/2 |       |           |                                                                                        |