Feature: ERP Management System

  As an ERP system user,
  I want to manage various business processes efficiently,
  So that I can streamline operations across finance, inventory, sales, procurement, HR, and reporting.

  Background:
    Given the ERP system is operational
    And the user is logged into the ERP dashboard

  Rule: User Management and Roles
    The system should allow for user registration, role assignments, and access control.

    Example: Register a new user successfully
      Given the admin is on the user registration page
      When the admin enters the following user details:
        | Username    | Email              | Role              |
        | john_doe    | john@example.com   | Finance Manager   |
      Then the user account should be created
      And the user should receive a registration confirmation email

    Example: Assign roles to a user
      Given the admin is on the user management page
      When the admin assigns the following roles:
        | Username  | Role              |
        | john_doe  | Finance Manager   |
      Then the user should have access to finance-related modules

  @SmokeTest
  Scenario: Login with various roles
    Given a user is on the login page
    When the user logs in with the following credentials:
      | Username    | Role              |
      | john_doe    | Finance Manager   |
    Then the user should see the dashboard relevant to their role