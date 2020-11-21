Feature: Password change

  Scenario Outline: Valid current password
    Given the following client:
      | user     | password     |
      | <user>   | <password>   |
    And  I am logged in the system
    And I am on the homepage
    When I follow "My Account"
    And I follow "Change password"
    And I fill in "Current password" with <password>
    And I fill in "New password" with "newPassword"
    And I fill in "Repeat password" with "newPassword"
    And I press "CHANGE PASSWORD"
    Then I should see "Requested completed with success"
    Examples:
      |  user           | password    |
      | user@domain.com | password123 |

  Scenario Outline: Repeat password that doesn't match the new password
    Given the following client:
      | user     | password     |
      | <user>   | <password>   |
    And  I am logged in the system
    And I am on the homepage
    When I follow "My Account"
    And I follow "Change password"
    And I fill in "Current password" with <password>
    And I fill in "New password" with "newPassword"
    And I fill in "Repeat password" with "newPass0rd"
    Then I should see a message "Bot password must match"
    And I should see "CHANGE PASSWORD" button disabled
    Examples:
      |  user           | password    |
      | user@domain.com | password123 |
