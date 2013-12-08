Feature: Registration

  Scenario: A User signs up
    Given that a user is on the registration page
    And he fills in all the information needed
    When he clicks on the "Sign up" button
    Then he should be registered on the system
    And he should be sent to the index page