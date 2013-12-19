Feature: All active cars

  Background:
    Given the user is already registered
    Given the user is already signed in
    And there is already an active Ad

  Scenario: A User sees all the active ads
    And he clicks on "Latest auctions"
    Then he should see just the active car
