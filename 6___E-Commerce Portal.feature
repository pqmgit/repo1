Feature: E-Commerce Portal

  As a registered user,
  I want to browse products, add them to the cart, and complete purchases,
  So that I can buy products from the e-commerce portal.

  Background:
    Given the user is logged into the e-commerce portal
    And the user is on the homepage

  @DataTest
  Scenario Outline: Add multiple products to the cart
    Given the user is on the product details page of "<Product>"
    When the user clicks the "Add to Cart" button
    Then the "<Product>" should be added to the cart
    And the cart icon should display the correct quantity of items
    
    Examples:
      | Product      |
      | Laptop       |
      | Smartphone   |
      | Headphones   |

  @NegativeTest
  Scenario: Unsuccessful checkout with expired card
    Given the user has the following items in the cart:
      | Product      | Quantity |
      | Laptop       | 1        |
      | Headphones   | 2        |
    When the user proceeds to checkout
    And the user enters the following card details:
      """
      Card Number: 1234 5678 9101 1121
      Expiry Date: 08/23
      CVV: 123
      """
    Then the payment should be declined
    And the user should see an error message indicating that the card has expired

  @PositiveTest
  Scenario: Successful checkout with valid card
    Given the user has the following items in the cart:
      | Product      | Quantity |
      | Laptop       | 1        |
      | Smartphone   | 1        |
    When the user proceeds to checkout
    And the user enters the following card details:
      """
      Card Number: 4111 1111 1111 1111
      Expiry Date: 12/25
      CVV: 123
      """
    Then the payment should be successful
    And the user should receive an order confirmation email

  @DataTest
  Scenario Outline: Filter products by price range
    Given the user is on the search results page for "Smartphones"
    When the user applies a filter for price range "<Price Range>"
    Then the user should see only smartphones within the "<Price Range>"

    Examples:
      | Price Range  |
      | $200 - $400  |
      | $400 - $600  |
      | $600 - $800  |

  @SmokeTest
  Scenario: View order history
    Given the user navigates to the order history page
    When the user views their past orders
    Then the user should see a list of all previous orders with details like order number, date, and total amount

