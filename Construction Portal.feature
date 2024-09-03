Feature: Construction Portal

  As a user of the construction portal,
  I want to be able to manage construction projects, handle bids, manage contractors, and process payments,
  So that I can streamline construction operations efficiently.

  Background:
    Given the construction portal is operational
    And the user is on the portal homepage

  # Section 1: User Registration and Login
  Rule: User registration and login functionality
    The system should allow users to register, log in, and manage their accounts.

    # Scenario 1: Register a new user
    Scenario: Register a new user successfully
      Given a user is on the registration page
      When the user enters valid registration details
      Then the user account should be created
      And the user should be redirected to the login page

    # Scenario 2: Login with valid and invalid credentials
    Scenario Outline: Login with various credentials
      Given a user is on the login page
      When the user enters "<email>" and "<password>"
      Then the login should "<result>"

      Examples:
        | email                    | password       | result                 |
        | validuser@example.com    | correctPass123 | succeed                |
        | invaliduser@example.com  | wrongPass123   | fail with error message |

  # Section 2: Project Management
  Rule: Managing construction projects
    Users should be able to create, update, view, and manage their construction projects.

    # Scenario 3: Create a new construction project
    Scenario: Create a new construction project
      Given a user is logged in
      And the user is on the "New Project" page
      When the user enters all the required project details
      Then the system should create the project
      And the project should be listed on the user's dashboard

    # Scenario 4: Update an existing construction project
    Scenario: Update an existing project
      Given a user has an existing project "Residential Complex"
      When the user updates the project details
      Then the system should save the changes
      And the updated details should be reflected in the project view

    # Scenario 5: View a list of all projects
    Scenario: View all projects
      Given a user is logged in
      When the user navigates to the "Projects" page
      Then the user should see a list of all their construction projects

  # Section 3: Bidding and Tender Management
  Rule: Managing bids and tenders for construction projects
    Users should be able to create tenders, accept bids, and manage the bidding process.

    # Scenario 6: Create a new tender for a project
    Scenario: Create a tender
      Given a user is managing a project "Office Building"
      When the user creates a new tender for "Plumbing Services"
      Then the tender should be available for bidding
      And contractors should be able to submit bids

    # Scenario 7: Submit a bid for a tender
    Scenario: Submit a bid
      Given a contractor is viewing a tender for "Electrical Work"
      When the contractor submits a bid
      Then the bid should be recorded in the system
      And the project owner should be notified of the new bid

    # Scenario 8: Accept a bid for a tender
    Scenario: Accept a bid
      Given a project owner has received bids for "Roofing Services"
      When the project owner accepts a bid
      Then the system should finalize the selection
      And notify the winning contractor

    # Scenario Outline: Manage bid status
    Scenario Outline: Bid status management
      Given a project owner is managing bids for a tender
      When the project owner changes the status of a bid to "<status>"
      Then the bid status should be updated to "<status>"
      And the contractor should be notified

      Examples:
        | status     |
        | Accepted   |
        | Rejected   |
        | Under Review |

  # Section 4: Contractor Management
  Rule: Managing contractor profiles and assignments
    Users should be able to manage contractor profiles, view contractor history, and assign them to projects.

    # Scenario 9: Create a contractor profile
    Scenario: Create a contractor profile
      Given a contractor is on the registration page
      When the contractor enters valid details
      Then the contractor profile should be created
      And the contractor should be able to log in

    # Scenario 10: View a contractor's profile
    Scenario: View contractor profile
      Given a project owner is logged in
      And has assigned contractors to projects
      When the project owner views a contractor's profile
      Then the contractor's details, project history, and ratings should be visible

    # Scenario 11: Assign a contractor to a project
    Scenario: Assign contractor to project
      Given a project owner has selected a contractor for a project
      When the project owner assigns the contractor to "Foundation Work"
      Then the contractor should be notified of the assignment
      And the project status should be updated

  # Section 5: Payment and Invoicing
  Rule: Managing payments and invoices
    Users should be able to process payments, generate invoices, and track payment history.

    # Scenario 12: Generate an invoice for completed work
    Scenario: Generate invoice
      Given a contractor has completed work on "Residential Complex"
      When the contractor generates an invoice
      Then the invoice should be sent to the project owner
      And the invoice should be visible in the contractor's payment history

    # Scenario 13: Process a payment
    Scenario: Process payment
      Given a project owner has received an invoice from a contractor
      When the project owner processes the payment
      Then the payment should be recorded
      And the contractor should be notified of the payment

    # Scenario 14: View payment history
    Scenario: View payment history
      Given a user is logged in
      When the user navigates to the "Payment History" page
      Then the user should see a list of all past payments and invoices

  # Section 6: Project Reporting
  Rule: Generating reports for projects and financials
    Users should be able to generate detailed reports on project progress, financials, and contractor performance.

    # Scenario 15: Generate a project progress report
    Scenario: Generate project progress report
      Given a project owner is managing a project "Mall Construction"
      When the project owner generates a progress report
      Then the report should include milestones, completion percentage, and any delays

    # Scenario 16: Generate a financial report
    Scenario: Generate financial report
      Given a user is logged in
      When the user generates a financial report
      Then the report should include all expenses, payments, and outstanding invoices

    # Scenario 17: Generate a contractor performance report
    Scenario: Generate contractor performance report
      Given a project owner has completed a project
      When the project owner generates a contractor performance report
      Then the report should include ratings, feedback, and performance metrics

  # Section 7: Notifications and Alerts
  Rule: Sending notifications and alerts for project updates, bids, and payments
    The system should send relevant notifications to users based on project events.

    # Scenario 18: Notify contractor of bid acceptance
    Scenario: Notify bid acceptance
      Given a project owner has accepted a contractor's bid
      When the bid is accepted
      Then the system should send a notification to the contractor

    # Scenario 19: Notify project owner of invoice submission
    Scenario: Notify invoice submission
      Given a contractor has submitted an invoice
      When the invoice is submitted
      Then the system should send a notification to the project owner

  # Section 8: Error Handling and Validation
  Rule: Proper error handling and input validation
    The system should handle errors gracefully and validate user inputs properly.

    # Scenario 20: Handle invalid project creation input
    Scenario: Invalid project creation input
      Given a user is on the "New Project" page
      When the user enters invalid project details (e.g., missing project name)
      Then the system should display an error message "Project name is required"
      And the project should not be created

    # Scenario 21: Validate email format during registration
    Scenario: Validate email format during registration
      Given a user is on the registration page
      When the user enters an invalid email format "user@invalid"
      Then the system should display an error message "Invalid email format"
      And the registration should not proceed

  # Section 9: User Roles and Permissions
  Rule: Managing user roles and permissions
    The system should enforce role-based access control for different users, such as project owners, contractors, and administrators.

    # Scenario 22: Restrict access to project management for non-owners
    Scenario: Restrict project management access
      Given a user is logged in as a contractor
      When the contractor attempts to access the "Project Management" page
      Then the system should deny access
      And display an error message "Access Denied"

    # Scenario 23: Admin access to user management
    Scenario: Admin user management access
      Given a user is logged in as an administrator
      When the admin navigates to the "User Management" page
      Then the admin should be able to view, update, and delete user accounts

  # Section 10: Reporting and Analytics
  Rule: Generating various reports and analyzing project and financial data

    # Scenario 24: Generate project cost report
    Scenario: Generate project cost report
      Given a user is managing a project
      When the user generates a cost report
      Then the report should show total project expenses and forecasted costs

    # Scenario 25: Analyze contractor performance over multiple projects
    Scenario: Contractor performance analysis
      Given a user is an admin
      When the user analyzes contractor performance
      Then the system should show aggregated data from all projects

# Section 11: Materials and Inventory Management
Rule: Managing materials, inventory, and procurement
  Users should be able to track materials and manage inventory for their construction projects.

  # Scenario 26: Add materials to a project inventory
  Scenario: Add materials to inventory
    Given a user is managing a project "Bridge Construction"
    When the user adds materials "Steel Beams" to the inventory
    Then the materials should be listed in the project inventory
    And the inventory count should be updated

  # Scenario 27: Update material quantities in inventory
  Scenario: Update material quantities
    Given a user is managing the inventory for "Skyscraper Project"
    When the user updates the quantity of "Concrete Mix" to 500 units
    Then the system should update the quantity in the inventory
    And notify the user of the successful update

  # Scenario 28: Generate a materials usage report
  Scenario: Generate materials usage report
    Given a user is managing materials for a project
    When the user generates a materials usage report
    Then the report should show the quantities used, remaining stock, and procurement needs

  # Scenario 29: Alert for low inventory levels
  Scenario: Low inventory alert
    Given a project is ongoing
    And the inventory of "Bricks" falls below the threshold of 100 units
    When the threshold is breached
    Then the system should send an alert to the project manager
    And suggest reordering materials

# Section 12: Site Inspection and Quality Assurance
Rule: Managing site inspections and ensuring quality assurance
  The system should allow project managers and inspectors to schedule inspections, log results, and manage quality checks.

  # Scenario 30: Schedule a site inspection
  Scenario: Schedule site inspection
    Given a project manager is managing the "Hospital Construction"
    When the project reaches the inspection stage
    Then the project manager should be able to schedule a site inspection
    And assign an inspector to the task

  # Scenario 31: Record site inspection results
  Scenario: Record inspection results
    Given an inspector is on-site for the "Bridge Construction" project
    When the inspector records the inspection results as "Pass"
    Then the system should log the results and notify the project manager

  # Scenario 32: Report safety issues during inspection
  Scenario: Report safety issues
    Given an inspector is on-site for a project
    When the inspector identifies a safety issue, such as "Faulty Scaffolding"
    Then the system should allow the inspector to report the issue
    And notify the safety officer immediately

  # Scenario 33: Generate inspection compliance report
  Scenario: Generate compliance report
    Given a project has undergone multiple inspections
    When the user generates a compliance report
    Then the report should include inspection dates, results, and any unresolved issues

# Section 13: Permits and Compliance Management
Rule: Handling permits and compliance with regulatory requirements
  The system should assist users in managing permits and ensuring compliance with local laws.

  # Scenario 34: Apply for a construction permit
  Scenario: Apply for permit
    Given a project manager is starting a new project "Commercial Building"
    When the manager applies for a construction permit through the portal
    Then the permit application should be submitted to the appropriate regulatory authority
    And the status should be tracked within the system

  # Scenario 35: Track permit approval status
  Scenario: Track permit status
    Given a project manager has applied for a construction permit
    When the manager checks the permit status
    Then the system should display the current status as "Pending", "Approved", or "Rejected"

  # Scenario 36: Handle permit expiration
  Scenario: Handle permit expiration
    Given a construction project is ongoing with a valid permit
    When the permit is about to expire in 30 days
    Then the system should notify the project manager
    And suggest actions to renew the permit

  # Scenario 37: Manage compliance documentation
  Scenario: Compliance documentation management
    Given a project is underway
    When the user uploads compliance documentation (e.g., environmental clearance)
    Then the system should store the documents
    And ensure they are available for regulatory review

# Section 14: Contractor Ratings and Feedback
Rule: Allowing project owners to rate contractors and provide feedback
  Project owners should be able to provide feedback on contractors and rate their performance.

  # Scenario 38: Rate a contractor after project completion
  Scenario: Rate contractor
    Given a project owner has completed a project
    When the project owner rates the contractor's performance as "5 stars"
    Then the system should log the rating
    And update the contractor's profile with the feedback

  # Scenario 39: Submit detailed feedback on contractor performance
  Scenario: Submit contractor feedback
    Given a project owner has completed a project with a contractor
    When the project owner submits feedback such as "Excellent workmanship, timely delivery"
    Then the feedback should be recorded in the contractor's profile
    And visible to other potential clients

  # Scenario 40: View contractor ratings and feedback
  Scenario: View contractor ratings
    Given a project owner is selecting a contractor for a new project
    When the owner views the contractor's profile
    Then the profile should display past ratings and feedback from other projects

# Section 15: Reporting and Analytics
Rule: Generating advanced reports and analyzing data
  Users should be able to generate advanced reports on project progress, costs, and contractor performance.

  # Scenario 41: Generate a project completion timeline report
  Scenario: Generate timeline report
    Given a project manager is managing a project
    When the manager generates a completion timeline report
    Then the report should display key milestones, delays, and expected completion date

  # Scenario 42: Analyze contractor performance across multiple projects
  Scenario: Analyze contractor performance
    Given a project owner has worked with multiple contractors
    When the owner analyzes contractor performance
    Then the system should provide aggregated data on contractor performance, including average ratings and feedback

  # Scenario 43: Generate a cost-benefit analysis report
  Scenario: Generate cost-benefit report
    Given a user is managing multiple projects
    When the user generates a cost-benefit analysis report
    Then the report should show project costs versus projected and actual benefits

# Section 16: Notifications and Alerts
Rule: Sending notifications and alerts for important project events
  The system should notify users of important events such as payment due dates, permit approvals, and upcoming inspections.

  # Scenario 44: Notify project owner of permit approval
  Scenario: Permit approval notification
    Given a project manager is awaiting permit approval
    When the permit is approved by the regulatory authority
    Then the system should send a notification to the project manager

  # Scenario 45: Notify contractor of payment due
  Scenario: Payment due notification
    Given a contractor has completed work
    When the payment due date approaches
    Then the system should send a reminder notification to the project owner to process the payment

  # Scenario 46: Notify project manager of upcoming inspection
  Scenario: Upcoming inspection notification
    Given a project is scheduled for an inspection
    When the inspection date is 2 days away
    Then the system should send a notification to the project manager

# Section 17: Multi-language Support
Rule: Supporting multiple languages for global users
  The system should allow users to select their preferred language and ensure the portal is fully localized.

  # Scenario 47: Set user language preference
  Scenario: Set language preference
    Given a user is logged in
    When the user selects "Spanish" as their preferred language
    Then the system should update the language of the portal to Spanish

  # Scenario 48: Display localized error messages
  Scenario: Localized error messages
    Given a user is using the portal in French
    When the user encounters an error
    Then the system should display the error message in French

  # Scenario 49: Generate reports in multiple languages
  Scenario: Generate reports in different languages
    Given a user prefers reports in German
    When the user generates a project report
    Then the report should be available in German

# Section 18: Mobile Access and Notifications
Rule: Ensuring mobile access and notifications for users
  The system should support mobile access to the portal and send mobile notifications for critical events.

  # Scenario 50: Access project management on mobile
  Scenario: Mobile project management
    Given a user is on a mobile device
    When the user logs in to the portal
    Then the user should be able to manage projects from their mobile device

  # Scenario 51: Send mobile push notifications for bids
  Scenario: Mobile push notifications
    Given a project owner is receiving bids
    When a new bid is submitted
    Then the system should send a mobile push notification to the project owner

  # Scenario 52: Access reports on mobile
  Scenario: Mobile report access
    Given a user is on a mobile device
    When the user generates a report
    Then the report should be accessible and viewable on the mobile device
