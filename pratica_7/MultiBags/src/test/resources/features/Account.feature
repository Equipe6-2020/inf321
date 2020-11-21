Feature: Create an account on marketplace

  Scenario Outline: User tries to create an account with an invalid input
    Given he following field combination is provided
      | First_name   | Last_name   | Country   | State   | Email   |  Password  |  Repeat  |
      | <first_name> | <last_name> | <country> | <state> | <email> | <password> | <repeat> |
    When The user presses the button "CREATE AN ACCOUNT"
    Then the following message shall be shown: $<message>

   # State: There is no validation on the content for State field, so any input given will be considered valid
    Examples:
      | First_name     | Last_name  | Country  | State   | Email             |  Password  |  Repeat   | Message                                           |
      | ""             | ""         | "Brazil" | ""      | ""                |  ""        |  ""       | "registration.password.not.empty}\nUser name is required\nField required\nEmail address is required\nField required"|
      | "Paulo Cesar"  | ""         | "Brazil" | ""      | ""                |  ""        |  ""       | "Email address is required\nField required\n{registration.password.not.empty}\nUser name is required"               |
      | "Paulo Cesar"  | "Maluco"   | "Brazil" | ""      | ""                |  ""        |  ""       | "User name is required\nEmail address is required\n{registration.password.not.empty}"                               |
      | "Paulo Cesar"  | "Maluco"   | "Brazil" | "AP"    | ""                |  ""        |  ""       | "{registration.password.not.empty}\nUser name is required\nEmail address is required"                               |
      | "Paulo Cesar"  | "Maluco"   | "Brazil" | "AP"    | "pcesml"          |  ""        |  ""       | "Email address is invalid\n{registration.password.not.empty}"                                                       |
      | "Paulo Cesar"  | "Maluco"   | "Brazil" | "AP"    | "pcesml@"         |  ""        |  ""       | "Email address is invalid\n{registration.password.not.empty}"                                                       |
      | "Paulo Cesar"  | "Maluco"   | "Brazil" | "AP"    | "pcesml@valid"    |  ""        |  ""       | "Email address is invalid\n{registration.password.not.empty}"                                                       |
      | "Paulo Cesar"  | "Maluco"   | "Brazil" | "AP"    | "pcesml@valid.ao" |  ""        |  ""       | "Password Invalid{registration.password.not.empty}"                                                                 |
      | "Paulo Cesar"  | "Maluco"   | "Brazil" | "AP"    | "pcesml@valid.ao" |  "1"       |  ""       | "{registration.password.not.empty}\npassword.notequal"                                                              |
      | "Paulo Cesar"  | "Maluco"   | "Brazil" | "AP"    | "pcesml@valid.ao" |  "1"       |  "1"      | "{registration.password.not.empty}"                                                                                 |


  Scenario Outline: User tries to create an account with a valid input
    Given he following field combination is provided
      | First_name   | Last_name   | Country   | State   | Email   |  Password  |  Repeat  |
      | <first_name> | <last_name> | <country> | <state> | <email> | <password> | <repeat> |
    When The user presses the button "CREATE AN ACCOUNT"
    Then the Dashboard page for the created user is shown

   # State: There is no validation on the content for State field, so any input given will be considered valid
    Examples:
      | First_name     | Last_name  | Country  | State   | Email             |  Password  |  Repeat   |
      | "Paulo Cesar"  | "Maluco"   | "Brazil" | "AP"    | "pcesml@valid.ao" |  "123456"  |  "123456" |
