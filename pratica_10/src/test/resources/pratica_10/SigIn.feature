Feature: Sign into Multibags web page

  Scenario Outline: Invalid login
    Given the user accessed the following options:
      |My Account|
      |Sign in   |
    When the user provides the following <email> and <password> pressing SIGN IN button
    Then the following <message> shall be shown

    Examples:
      |     email         |       password        | message                                            |
      | "pcesml@valid.ao" |       "654321"        | "Login Failed. Username or Password is incorrect." |
      |       ""          |       ""              | "Login Failed. Username or Password is incorrect." |
      | "pcesml"          |       "654321"        | "Login Failed. Username or Password is incorrect." |