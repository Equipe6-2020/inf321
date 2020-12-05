Feature: Password change

  Scenario Outline: Valid change password procedure
    Given the following client:
      | user     | password     |
      | <user>   | <password>   |
    And  I am logged in the system
    And I am on the homepage
    When I follow "My Account"
    And I follow "Change password"
    And I fill in "Current password" with <password>
    And I fill in "New password" with <newpassword>
    And I fill in "Repeat password" with <repeatpassword>
    And I press "CHANGE PASSWORD"
    Then I should see "Requested completed with success"
    Examples:
      | user             | password    |  newpassword  |  repeatpassword  |
      | pcesml@valid.ao  | 123456      |  1122334455   |    1122334455    |

  Scenario Outline: invalid change password usage
    Given the following client:
      | user     | password     |
      | <user>   | <password>   |
    And  I am logged in the system
    And I am on the homepage
    When I follow "My Account"
    And I follow "Change password"
    And I fill in "Current password" with <password>
    And I fill in "New password" with <newpassword>
    And I fill in "Repeat password" with <repeatpassword>
    Then I should see a message <message>
    And I should see "CHANGE PASSWORD" button disabled
    Examples:
      |  user           | password    |  newpassword  |  repeatpassword  | message                    |
      | pcesml@valid.ao | 123456      |  newPassword  |   NOTnewPassword | "Both password must match" |
      | pcesml@valid.ao | 654321      |  newPassword  |    newPassword   | "Invalid password"         |


  Scenario Outline: Invalid Current Password
    Given the following client:
      | user     | password     |
      | <user>   | <password>   |
    And  I am logged in the system
    And I am on the homepage
    When I follow "My Account"
    And I follow "Change password"
    And I fill in "Current password" with "password1234"
    And I fill in "New password" with "newPassword"
    And I fill in "Repeat password" with "newPassword"
    And I press "CHANGE PASSWORD"
    Then I should see a message "Invalid password"
    Examples:
      |  user           | password    |
      | user@domain.com | password123 |
