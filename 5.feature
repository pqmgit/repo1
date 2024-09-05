Feature: ERP Management System

  As an ERP system user,
  I want to manage various business processes efficiently,
  So that I can streamline operations across finance, inventory, sales, procurement, HR, and reporting.

  Background:
    Given the ERP system is operational
    And the user is logged into the ERP dashboard

  Rule: User Management and Roles
    The system should allow for user registration, role assignments, and access control.
    
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

  Rule: Managing Financial Transactions and Reporting
    The system should handle transactions, manage accounts, and generate financial reports.

    Example: Create a new financial account
      Given the finance manager is on the account management page
      When the finance manager creates a new account "Savings Account"
      Then the account should be listed in the account overview

    Example: Record a transaction
      Given the finance manager is on the transactions page
      When the manager records the following transaction:
        | Amount  | Description         |
        | 1000    | Operating Expenses  |
      Then the transaction should be recorded in the system
      And the account balance should be updated


  Scenario Outline: Apply filters on the employee management page
    Given the HR manager is on the employee management page
    When the manager applies a filter for "<filter_type>"
    Then the employee list should be filtered based on "<filter_type>"
    
    Examples:
      | filter_type      |
      | Position         |
      | Department       |
      | Salary Range     |