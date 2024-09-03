Feature: Payroll Management System

  As an HR Manager,
  I want to ensure that payroll is processed accurately and on time,
  So that employees are compensated correctly according to company policy.

  Background:
    Given the payroll period is set to the current month
    And employee records are up to date in the system

  # Rule 1: Payroll Calculation
  Rule: Calculate payroll based on salary, leaves, and overtime
    The payroll calculation should account for the employee's base salary,
    any unpaid leave, and any overtime worked during the payroll period.

    # Example 1: Processing payroll for an employee without deductions
    Example: Process payroll for a salaried employee with no deductions
      Given an employee "John Doe" with a monthly salary of $5000
      And "John Doe" has worked the full month with no leave
      When the payroll is processed
      Then the gross salary should be $5000
      And the tax deduction should be $500
      And the net salary should be $4500

    # Example 2: Processing payroll for an employee with unpaid leave
    Example: Process payroll for an employee with unpaid leave
      Given an employee "Jane Doe" with a monthly salary of $4000
      And "Jane Doe" has taken 3 days of unpaid leave
      When the payroll is processed
      Then the gross salary should be adjusted based on unpaid leave
      And the net salary should be calculated accordingly

  # Rule 2: Tax Calculation
  Rule: Tax calculation based on salary brackets
    The system should calculate tax deductions based on predefined salary brackets.

    # Scenario Outline for calculating tax
    Scenario Outline: Calculate tax based on salary brackets
      Given an employee "<employee_name>" with a monthly salary of "<salary>"
      When the tax is calculated
      Then the tax deduction should be "<expected_tax>"

      Examples:
        | employee_name  | salary | expected_tax |
        | Alice Smith    | 3000   | 300          |
        | Bob Johnson    | 6000   | 600          |
        | Charlie Brown  | 9000   | 900          |

  # Rule 3: Overtime and Benefits
  Rule: Adjust payroll for overtime and benefits deductions
    Employees who work overtime or have benefit deductions should have their payroll adjusted accordingly.

    # Example 1: Process payroll with overtime pay
    Example: Process payroll for an employee with overtime
      Given an employee "Emily Clark" with a monthly salary of $4500
      And "Emily Clark" has worked 10 hours of overtime
      When the payroll is processed
      Then the salary should include overtime pay based on the overtime rate
      And the net salary should be adjusted accordingly

    # Example 2: Process payroll with benefits deduction
    Example: Process payroll with health insurance deduction
      Given an employee "Tom White" with a monthly salary of $5000
      And "Tom White" has a health insurance deduction of $200
      When the payroll is processed
      Then the gross salary should be adjusted for the benefits deduction
      And the net salary should reflect the deduction

  # Rule 4: Payroll Notifications
  Rule: Notify employees after payroll processing
    Employees should be notified via email after their payroll is processed.

    # Scenario Outline for sending notifications
    Scenario Outline: Send email notification after payroll processing
      Given the payroll for "<employee_name>" has been processed
      When the payroll is finalized
      Then an email notification should be sent to "<employee_email>"
      And the notification should include the payroll summary

      Examples:
        | employee_name  | employee_email           |
        | John Doe       | john.doe@example.com     |
        | Jane Doe       | jane.doe@example.com     |
        | Emily Clark    | emily.clark@example.com  |

  # Rule 5: Error Handling
  Rule: Handle errors during payroll processing
    The system should provide meaningful error messages when payroll processing fails.

    # Example 1: Process payroll for a non-existent employee
    Example: Process payroll for an invalid employee
      Given an employee "Invalid User" does not exist in the system
      When the payroll is processed
      Then an error message should be displayed saying "Employee not found"
      And no payroll should be processed

  # Rule 6: Bonus and Leave Adjustments
  Rule: Adjust payroll for year-end bonuses and paid time off
    Employees who are eligible for bonuses or have used paid time off should have their payroll adjusted accordingly.

    # Example 1: Process year-end bonuses for eligible employees
    Example: Process year-end bonuses
      Given it is the year-end period
      And all eligible employees are listed
      When year-end bonuses are calculated
      Then each employee should receive the correct bonus amount
      And the bonus should be added to their next payroll

    # Example 2: Adjust payroll based on paid time off (PTO)
    Example: Process payroll with PTO adjustment
      Given an employee "Sara Lee" with a monthly salary of $4500
      And "Sara Lee" has used 5 days of paid time off (PTO)
      When the payroll is processed
      Then the gross salary should be adjusted to account for the PTO used
      And the net salary should reflect the adjustment

  # Rule 7: Report Generation
  Rule: Generate payroll reports
    The system should generate detailed payroll reports for HR and accounting purposes.

    # Example: Generate payroll reports for the current month
    Example: Generate payroll reports
      Given payroll for all employees has been processed
      When I generate the payroll report for the current month
      Then the report should include all employees' net salaries, tax deductions, and benefits
      And the report should be exported as a PDF