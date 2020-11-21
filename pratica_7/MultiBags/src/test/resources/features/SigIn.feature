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
    Then the following message shall be shown: <$message>

    Examples:
      |     email       |       password        |
      |    <email>      |      <password>       |

    When the Account Holder requests "My Account"
    When the Account Holder requests "Sign in"
    Then the portal should open a form for typing $<Current_email_address>
    And the $<password>
    When the Account Holder requests "SIGN IN"
    Given the following client:
      | user     | user@domain.com |
      | password | password123     |
    Then the portal should open My_Account page

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
      | "pcesml@valid.ao" |       "654321"        |
