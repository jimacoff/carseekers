Feature: Delete message

  Background:
    Given the user is already registered
    Given the user is already signed in
    Given that there is another user already registered
    Given that there is already an ad
    Given that there is already another message

    @wip
    Scenario: A User deletes a message
    Given that he is on his profile
    When he deletes a message
    Then he should not see that message anymore