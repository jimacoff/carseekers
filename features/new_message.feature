Feature: New message

  Background:
    Given the user is already registered
    Given the user is already signed in
    Given that there is another user already registered
    Given that there is already an ad

  Scenario: A User sends a new message
    Given that he is already on another user's ad
    When he fills in the message
    Then he should see a notice as sent
