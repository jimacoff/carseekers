Feature: Nick Validation

  Background:
    Given there is already another user registered with the nick that the user is going to choose

  Scenario: A user selects a previously used Nick
    Given that a user is on the registration page
    And he fills in all the information needed with an already taken nick
    When he clicks on the "Sign up" button
    Then he should see one error "Nick has already been taken"
