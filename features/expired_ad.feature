Feature: Expired Ad

  Background:
    Given there is an user, an ad (expired) and a previous msg and he is on his profile

  Scenario: A tries to visit an expired Ad
    Then he should have not access to the expired Ad
