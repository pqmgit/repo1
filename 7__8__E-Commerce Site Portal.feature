Feature: E-Commerce Site Portal

  As a user,
  I want to browse and purchase products on the e-commerce site,
  So that I can shop for goods online conveniently.

  Background:
    Given the site is available
    And the user is on the homepage

  # Section 1: User Registration and Login
  Rule: User registration and login functionality
    The system should allow users to register and log in with valid credentials.

    # Scenario 1: Register a new user
    Scenario: Register a new user successfully
      Given a user is on the registration page
      When the user enters valid registration details
      Then the user account should be created
      And the user should be redirected to the login page

    # Scenario 2: Attempt to register with an existing email
    Scenario: Register with an existing email
      Given a user is on the registration page
      And an account with email "existinguser@example.com" already exists
      When the user attempts to register with "existinguser@example.com"
      Then the system should display an error message "Email already in use"
      And the registration should fail

    # Scenario Outline: Login with valid and invalid credentials
    Scenario Outline: User login attempt
      Given a user is on the login page
      When the user enters "<email>" and "<password>"
      Then the login should "<result>"

      Examples:
        | email                     | password      | result                 |
        | validuser@example.com     | validpass123  | succeed                |
        | invaliduser@example.com   | wrongpass123  | fail with error message |
        | validuser@example.com     | wrongpass123  | fail with error message |

  # Section 2: Product Browsing and Search
  Rule: Browsing and searching for products
    Users should be able to browse, search, and filter products on the site.

    # Scenario 3: Browse products by category
    Scenario: Browse products by category
      Given a user is on the homepage
      When the user selects the "Electronics" category
      Then the user should see a list of products under "Electronics"

    # Scenario 4: Search for a specific product
    Scenario: Search for a specific product
      Given a user is on the homepage
      When the user searches for "iPhone"
      Then the search results should include products matching "iPhone"

    # Scenario 5: Filter products by price range
    Scenario: Filter products by price range
      Given a user is viewing a product category
      When the user applies a price filter for $500 to $1000
      Then the user should only see products within that price range