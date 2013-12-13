Feature: Expired Ad

  Background:
    Given the user is already registered
    Given the user is already signed in
    And there is already an expired Ad

  @wip
  Scenario: A tries to visit an expired Ad
    Given that he is on his profile
    When he clicks on the Ad title to access the expired Ad
    Then he should have not access to the expired Ad
    Then he should see "Alert: This Ad has expired"