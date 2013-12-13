Feature: All active cars

  Background:
    Given the user is already registered
    Given the user is already signed in
    And there is already an expired Ad
    And there is already an active Ad

  Scenario: A User sees all the active ads
    Given that he is on the homepage
    And he clicks on "Latest auctions"
    Then he should see just the active car
