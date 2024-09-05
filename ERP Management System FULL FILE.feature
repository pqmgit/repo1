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

  Scenario: Generate a monthly financial report
    Given the finance manager is on the reporting page
    When the manager generates a monthly financial report
    Then the report should include income, expenses, and profit/loss statements

  Rule: Inventory Management and Stock Levels
    The system should track inventory levels, manage stock, and handle inventory orders.

    Example: Add inventory item
      Given the warehouse manager is on the inventory page
      When the manager adds a new item with the following details:
        | Item Name | Quantity | Price |
        | Laptop    | 50       | 1000  |
      Then the item should be listed in the inventory

    Example: Update stock levels
      Given the warehouse manager is on the inventory page
      When the manager updates the stock level of the following item:
        | Item Name | New Quantity |
        | Laptop    | 30           |
      Then the inventory count should reflect the updated quantity

  Scenario: Generate inventory stock report
    Given the warehouse manager is on the inventory report page
    When the manager generates a stock report
    Then the report should display the current stock levels and restocking recommendations

  Rule: Procurement and Order Management
    The system should manage procurement orders and ensure inventory is restocked appropriately.

    Example: Create a new procurement order
      Given the procurement manager is on the procurement page
      When the manager creates a new order with the following details:
        | Supplier   | Item     | Quantity | Price |
        | ABC Corp   | Laptop   | 100      | 900   |
      Then the order should be submitted and awaiting approval

    Example: Approve procurement order
      Given the procurement manager is on the order approval page
      When the manager approves the order for the following item:
        | Order ID  | Item     | Quantity |
        | 1234      | Laptop   | 100      |
      Then the order status should be updated to "Approved"
      And the inventory should be updated once the items are received

  @NegativeTest
  Scenario: Record invalid financial data
    Given the finance manager is entering financial data
    When the manager enters invalid data such as negative amounts
    Then the system should display an error message "Invalid financial data"

  @NegativeTest
  Scenario: Attempt to create a user with an existing email
    Given the admin is on the user registration page
    When the admin tries to create a user with an email that already exists in the system
    Then the system should display an error message "Email already in use"

  @PositiveTest
  Scenario: Successful user password reset
    Given the user is on the password reset page
    When the user enters their email and submits the reset request
    Then the system should send a password reset email to the user's email address

  @NegativeTest
  Scenario: Invalid login attempt
    Given a user is on the login page
    When the user enters incorrect credentials
    Then the system should display an error message "Invalid username or password"

  Rule: HR Management
    The system should allow HR managers to manage employee records and payroll.

    Example: Add a new employee record
      Given the HR manager is on the employee management page
      When the manager adds a new employee with the following details:
        | Name        | Position       | Salary |
        | John Doe    | Developer      | 60000  |
      Then the employee should be added to the employee records

    Example: Generate payroll report
      Given the HR manager is on the payroll report page
      When the manager generates a monthly payroll report
      Then the report should include salaries, deductions, and net payments for all employees

  Scenario: Approve leave request
    Given the HR manager is on the leave management page
    When the manager approves a leave request for the following employee:
      | Employee Name | Leave Days |
      | Jane Smith    | 5          |
    Then the employee's leave status should be updated to "Approved"

  Scenario Outline: Apply filters on the employee management page
    Given the HR manager is on the employee management page
    When the manager applies a filter for "<filter_type>"
    Then the employee list should be filtered based on "<filter_type>"
    
    Examples:
      | filter_type      |
      | Position         |
      | Department       |
      | Salary Range     |
