Feature: Notes
  In order to remember what I've been talking about
  As a call sender
  I want to add some notes

  Scenario: Displaying notes
    Given I am on the homepage
    When I call "+41 76373 0787"
    Then I should see "Notes"
    And I should see "Add a note"
