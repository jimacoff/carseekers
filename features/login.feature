Feature: Login

  Background:
    Given the user is already registered

  @javascript
  Scenario: A User signs in
    Given that he is on the homepage
    And he clicks on "Sign in - Register"
    And he clicks on "Sign in"
    Then he fills in all the information needed for login
    And he clicks on the "Sign in" button
    Then he should be logged in
    And he should be sent to the index page

