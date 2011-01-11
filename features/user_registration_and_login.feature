Feature: User Registration and Login
  In order to access my calling information
  As a User
  I want to register and login to Call-Q

  Scenario: User Registration
    Given I am on the homepage
    When I follow "Sign up"
    And I fill in "Email" with "someuser@example.com"
    And I fill in "Password" with "somepassword"
    And I fill in "Password confirmation" with "somepassword"
    And I press "Sign up"
    Then I should see "You have signed up successfully."
    And I should see "someuser@example.com"

  Scenario: User Login
    Given I registered as "bob@example.com" with password "somepassword"
    And I am on the homepage
    When I follow "Sign in"
    And I fill in "Email" with "bob@example.com"
    And I fill in "Password" with "somepassword"
    And I press "Sign in"
    Then I should see "Signed in successfully."
    And I should be on the homepage
