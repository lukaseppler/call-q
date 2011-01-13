Feature: Notes
  In order to remember what I've been talking about
  As a call sender
  I want to add some notes

  Scenario: Displaying notes
    Given I am on the homepage
    When I call "+41 67374 8787"
    Then I should see "Notes"

  Scenario: Create a note
    Given I am on the homepage
    And I have no notes for "+123 456 0987"
    When I call "+123 456 0987"
    And I fill in "Content" with "I'm talking with Emma about Node.js" within "#notes"
    And I press "Create note"
    Then I should see "Note was created. Keep describing!"
    And I should see "I'm talking with Emma about Node.js"
