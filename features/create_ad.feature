Feature: Create a new Ad

  Background:
    Given the user is already registered
    Given the user is already signed in

  Scenario: A User creates a new Ad
    Given he is in the new Ad page
    When he fills in the Ad information
    And he should see all the info on his Ad
    Then he should see his new Ad on his profile page