Feature: Edit Ad

  Background:
    Given the user is already registered
    Given the user is already signed in

  Scenario: A User edits his previously published Ad
    Given that a user has a previously published Ad
    And he is on his profile page
    When he clicks on Edit Ad
    Then he should see all the Ad information ready to be edited
    And he should edit the information
    Then he should see all the new information