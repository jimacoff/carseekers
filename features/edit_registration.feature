Feature: Edit registration on profile edit

  Background:
    Given the user is already registered
    Given the user is already signed in

  Scenario: A User edits is registration information

    Given that he is on his profile
    And he has clicked on the "Edit Profile" link
    Then he should be on the edit profile page
    And he should see his previous registration data already filled in
    And he edits his personal information
    When he clicks on the "Update Profile" button
    Then he should see his new edited information on the edit page