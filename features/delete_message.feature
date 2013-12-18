Feature: Delete message

  Background:
    Given there is an user, an ad and a previous msg and he is on his profile

    @javascript
    Scenario: A User deletes a message
    When he deletes a message
    Then he should not see that message anymore