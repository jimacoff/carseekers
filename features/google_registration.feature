Feature: Registration with Google Account

  Scenario: A User signs up with its Google Account
    Given that he is on the homepage
    And he has clicked on the "Sign in/up with Google" link
    Then he should accept the requirements
    And he should be then on the registration page
    Then he should see his email already filled in
    And he fills in all the information needed
    When he clicks on the "Sign up" button
    Then he should be registered on the system
    And he should be sent to the index page
