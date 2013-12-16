Feature: Search feature

  Background:
    Given the user is already registered
    Given the user is already signed in
    Given that there is another user already registered
    Given that there is already various ads

  @javascript
  Scenario: A User searchs for a particular car
    Given that he is on the homepage
    When he selects the car to search
    Then he should see a list of cars that matches the criteria