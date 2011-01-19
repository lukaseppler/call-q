Feature: Calling a phone
  In order to not forget about calls
  As a User who has many calls to make
  I want to make calls, take notes, and re-schedule them

  Background:
    Given I am logged in

  Scenario: Make a Call
    When I go to the homepage
    And I fill in "phone_number" with "+411 111 1111"
    And I press "Call"
    Then I should see "Call +41 11 111 11 1"

  Scenario Outline: System normalizes phone numbers
    When I go to the homepage
    And I fill in "phone_number" with "<phone_number>"
    And I press "Call"
    Then I should see "Call <formatted_phone>"

    Examples: Full number prefixed and separated with spaces
      | phone_number     | formatted_phone |
      | +41 76373 0787   | +41 76 373 07 87 |
      | +41 76 373 07 87 | +41 76 373 07 87 |

  Scenario: Describe a phone number with a name
    Given I am on the homepage
    When I call "+411 123 456 789"
    And I fill in "Name" with "Jane Doe"
    And I press "Update"
    Then I should see "Phone information was succesfully updated"
