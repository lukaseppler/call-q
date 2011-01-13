Feature: Notes
  In order to remember what I've been talking about
  As a call sender
  I want to add some notes

  Scenario: Displaying notes
    Given I am on the homepage
    When I call "+41 76373 0787"
    Then I should see "Notes"
    And I should see "Add a note"

  Scenario: Create a note
    Given I am on the homepage
    When I call "+123 456 7890"
    And I fill in "Content" with "I'm talking with Emma about Node.js" within "#notes"
    And I press "Create note"
    Then I should see "Note was created. Keep describing!"
    And I should have 1 note on the phone number
    And I should see "I'm talking to Emma about Node.js"
