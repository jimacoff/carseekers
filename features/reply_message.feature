Feature: New message

  Background:
    Given there is an user, an ad and a previous msg and he is on his profile

    Scenario: A User replies to a message
    When he clicks on the message subject
    Then he should see the previous message
    And he should fill the reply form
    Then he should have that message as sent