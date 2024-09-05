Feature: ERP Management System

  As an ERP system user,
  I want to manage various business processes efficiently,
  So that I can streamline operations across finance, inventory, sales, procurement, HR, and reporting.

  Background:
    Given the ERP system is operational
    And the user is logged into the ERP dashboard

  @DataTest
  Scenario Outline: Create new user accounts with different roles
    Given the admin is on the user registration page
    When the admin enters the following user details:
      | Username    | Email              | Role              |
      | <username>  | <email>            | <role>            |
    Then the user account should be created
    And the user should receive a registration confirmation email
    
    Examples:
      | username     | email              | role              |
      | john_doe     | john@example.com   | Finance Manager   |
      | jane_smith   | jane@example.com   | Sales Executive   |
      | mike_jones   | mike@example.com   | HR Specialist     |