Feature: Sign into Multibags web page

  Scenario Outline: Account has been created
    Given the user accessed the following options
      | My Account |
      | Sign in    |
    When user selected SignIn option
    Then the portal should open a form for typing email and password

  Scenario Outline: Invalid login
    Given the user accessed the following options:
      |My Account|
      |Sign in   |
    When the user provides the following email and password pressing SIGN IN button:
      |     email       |       password        |
      |    <email>      |      <password>       |
    Then the following message shall be shown: <message>

    Examples:
      |     email         |       password        | message
      | "pcesml@valid.ao" |       "654321"        | "Login Failed. Username or Password is incorrect."
      |       ""          |       ""              | "Login Failed. Username or Password is incorrect."
      | "pcesml"          |       "654321"        | "Login Failed. Username or Password is incorrect."

  Scenario Outline: Valid login
    Given the user accessed the following options:
      |My Account|
      |Sign in   |
    When the user provides the following email and password pressing SIGN IN button:
      |     email       |       password        |
      |    <email>      |      <password>       |
    Then the following page shall be shown to the user: shop/customer/dashboard.html

    Examples:
      |     email         |       password        |
      | "pcesml@valid.ao" |       "123456"        |
