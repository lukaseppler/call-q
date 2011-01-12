Feature: Calling a phone
  In order to not forget about calls
  As a User who has many calls to make
  I want to make calls, take notes, and re-schedule them

  Background:
    Given I am logged in

  Scenario: Make a Call
    When I go to the homepage
    And I fill in "phone_number[number]" with "+411 111 1111"
    And I press "Call"
    Then I should see "The phone number has been stored."
    And I should see "Please click below to call"
