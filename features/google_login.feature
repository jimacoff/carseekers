Feature: Login with Google Account

  Background:
    Given the user is already registered with its Google Account

  Scenario: A User signs in with Google Account
    Given that he is on the homepage
    And he clicks on "Sign in with your Google account"
    And he should be sent to the index page