Feature: End date feature

  Background:
    Given the user is already registered
    Given the user is already signed in
    And there is make and model on the system
    Given he is in the new Ad page

  Scenario: A User creates a new Ad with ending date
    When he insert "30 Days" as end date for the ad
    Then he should see "30 days" as remaining time for the ad
