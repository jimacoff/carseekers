Feature: New message

  Background:
    Given the user is already registered
    Given the user is already signed in
    Given that there is another user already registered
    Given that there is already an ad
    Given that there is already another message

    Scenario: A User replies to a message
    Given that he is on his profile
    When he clicks on the message subject
    Then he should see the previous message
    And he should fill the reply form
    Then he should have that message as sent

