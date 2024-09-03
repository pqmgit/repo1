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

  # Section 3: Product Details and Reviews
  Rule: Viewing product details and customer reviews
    Users should be able to view detailed information about products, including customer reviews.

    # Scenario 6: View product details
    Scenario: View product details
      Given a user is viewing a product list
      When the user clicks on a product
      Then the user should be redirected to the product detail page
      And the product details, price, and availability should be displayed

    # Scenario 7: View customer reviews for a product
    Scenario: View customer reviews
      Given a user is on a product detail page
      When the user scrolls to the reviews section
      Then the user should see customer reviews for the product

  # Section 4: Shopping Cart Management
  Rule: Managing the shopping cart
    Users should be able to add, update, and remove items in their shopping cart.

    # Scenario 8: Add a product to the shopping cart
    Scenario: Add a product to the cart
      Given a user is on a product detail page
      When the user clicks the "Add to Cart" button
      Then the product should be added to the shopping cart
      And the cart icon should display the updated item count

    # Scenario 9: Remove a product from the shopping cart
    Scenario: Remove a product from the cart
      Given a user has products in their shopping cart
      When the user removes a product from the cart
      Then the product should be removed from the cart
      And the cart icon should display the updated item count

    # Scenario Outline: Update product quantity in the cart
    Scenario Outline: Update product quantity
      Given a user has products in their shopping cart
      When the user updates the quantity of "<product_name>" to "<quantity>"
      Then the cart should reflect the updated quantity
      And the total price should be updated accordingly

      Examples:
        | product_name | quantity |
        | iPhone       | 2        |
        | Laptop       | 3        |

  # Section 5: Checkout and Payment Process
  Rule: Checkout process and payment handling
    Users should be able to complete the checkout process, including payment.

    # Scenario 10: Proceed to checkout
    Scenario: Proceed to checkout
      Given a user has items in their shopping cart
      When the user clicks the "Checkout" button
      Then the user should be redirected to the checkout page

    # Scenario 11: Fill out shipping information during checkout
    Scenario: Fill out shipping information
      Given a user is on the checkout page
      When the user enters valid shipping information
      Then the system should save the shipping information

    # Scenario 12: Complete payment during checkout
    Scenario: Complete payment
      Given a user is on the payment page during checkout
      When the user enters valid payment details
      Then the payment should be processed
      And the user should receive an order confirmation

    # Scenario Outline: Payment failure due to invalid card
    Scenario Outline: Payment failure
      Given a user is on the payment page during checkout
      When the user enters "<card_number>" with "<card_status>"
      Then the payment should "<result>"

      Examples:
        | card_number      | card_status      | result                   |
        | 4111111111111111 | expired          | fail with error message  |
        | 5555555555554444 | insufficient_funds | fail with error message |
        | 6011111111111117 | valid            | succeed                  |

  # Section 6: Order History and Tracking
  Rule: Viewing order history and tracking
    Users should be able to view their order history and track shipments.

    # Scenario 13: View order history
    Scenario: View order history
      Given a user is logged in
      When the user navigates to the "Order History" page
      Then the user should see a list of past orders

    # Scenario 14: Track a shipment
    Scenario: Track a shipment
      Given a user is viewing their order history
      And the order status is "Shipped"
      When the user clicks the "Track Shipment" button
      Then the system should display the shipment tracking information

  # Section 7: User Account Management
  Rule: Managing user account settings
    Users should be able to update their personal information, change passwords, and manage addresses.

    # Scenario 15: Update user profile information
    Scenario: Update profile information
      Given a user is logged in
      When the user navigates to the "Profile" page
      And the user updates their personal information
      Then the system should save the updated information
      And the changes should be reflected in the user's profile

    # Scenario 16: Change user password
    Scenario: Change password
      Given a user is logged in
      When the user navigates to the "Change Password" page
      And the user enters a valid current password and a new password
      Then the system should update the user's password
      And the user should be able to log in with the new password

    # Scenario 17: Manage saved addresses
    Scenario: Manage addresses
      Given a user is logged in
      When the user navigates to the "Addresses" page
      And the user adds a new shipping address
      Then the system should save the new address
      And the user should see the updated list of saved addresses

  # Section 8: Promotions and Discounts
  Rule: Applying promotions and discounts during checkout
    Users should be able to apply valid promotional codes and discounts to their orders.

    # Scenario 18: Apply a valid promo code
    Scenario: Apply valid promo code
      Given a user is on the checkout page
      When the user enters a valid promo code "SAVE20"
      Then the system should apply a 20% discount to the total order value

    # Scenario 19: Attempt to apply an invalid promo code
    Scenario: Apply invalid promo code
      Given a user is on the checkout page
      When the user enters an invalid promo code "INVALIDCODE"
      Then the system should display an error message "Invalid promo code"
      And no discount should be applied

  # Section 9: Notifications and Alerts
  Rule: Sending notifications and alerts to users
    The system should send order and shipment notifications to users via email and SMS.

    # Scenario 20: Send order confirmation email
    Scenario: Send order confirmation email
      Given a user has completed an order
      When the order is confirmed
      Then the system should send an order confirmation email to the user

    # Scenario 21: Send shipment notification SMS
    Scenario: Send shipment notification SMS
      Given a user has an order that has shipped
      When the shipment is dispatched
      Then the system should send a shipment notification SMS to the user

  # Section 10: Error Handling and Validation
  Rule: Proper error handling and input validation
    The system should handle errors gracefully and validate user inputs properly.

    # Scenario 22: Handle invalid product search query
    Scenario: Invalid product search query
      Given a user is on the homepage
      When the user searches for an invalid query "!@#$%"
      Then the system should display a message "No results found"
      And the user should be able to perform another search

    # Scenario 23: Validate email format during registration
    Scenario: Validate email format during registration
      Given a user is on the registration page
      When the user enters an invalid email format "user@invalid"
      Then the system should display an error message "Invalid email format"
      And the registration should not proceed