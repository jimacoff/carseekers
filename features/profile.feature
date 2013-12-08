Feature: User profile

  Background:
    Given the user is already registered
    And the user is already signed in

  Scenario: A user sees its profile
    Given that he is on his profile
    Then he should see his personal information on it
