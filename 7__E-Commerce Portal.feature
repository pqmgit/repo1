Feature: E-Commerce Portal

  As a registered user,
  I want to browse products, add them to the cart, and complete purchases,
  So that I can buy products from the e-commerce portal.

  Background:
    Given the user is logged into the e-commerce portal
    And the user is on the homepage

  @SmokeTest
  Scenario: Search for a product by name
    Given the user enters "Laptop" in the search bar
    When the user clicks the search button
    Then the user should see a list of laptops
    And the user should see the "Filters" option to refine the search

  Rule: Adding Products to Cart
    The user must be able to add products to the shopping cart from the product page.

    Example: Successful product addition to the cart
      Given the user is on the product details page of a "Laptop"
      When the user clicks the "Add to Cart" button
      Then the product should be added to the shopping cart
      And the cart icon should display the correct quantity of items

    Example: Product already in cart
      Given the user has already added a "Smartphone" to the cart
      When the user tries to add the same "Smartphone" to the cart again
      Then the cart quantity should be updated to 2 for that product
      And the total cart quantity should be updated accordingly

  Rule: Checkout Process
    The user must be able to successfully complete a purchase by providing valid payment details.

    Example: Successful checkout with valid card
      Given the user has the following items in the cart:
        | Product      | Quantity |
        | Laptop       | 1        |
        | Smartphone   | 1        |
      When the user proceeds to checkout
      And the user enters valid card details:
        """
        Card Number: 4111 1111 1111 1111
        Expiry Date: 12/25
        CVV: 123
        """
      Then the payment should be successful
      And the user should receive an order confirmation email

    Example: Unsuccessful checkout with expired card
      Given the user has the following items in the cart:
        | Product      | Quantity |
        | Laptop       | 1        |
        | Headphones   | 2        |
      When the user proceeds to checkout
      And the user enters expired card details:
        """
        Card Number: 1234 5678 9101 1121
        Expiry Date: 08/23
        CVV: 123
        """
      Then the payment should be declined
      And the user should see an error message indicating that the card has expired

  Rule: Discount Coupons
    The system must handle discount coupons correctly during the checkout process.

    Example: Apply valid discount coupon
      Given the user has the following items in the cart:
        | Product    | Quantity |
        | Laptop     | 1        |
      When the user enters the discount coupon "SAVE10"
      Then a 10% discount should be applied to the total
      And the updated total should be displayed

    Example: Apply invalid discount coupon
      Given the user has the following items in the cart:
        | Product    | Quantity |
        | Laptop     | 1        |
      When the user enters the discount coupon "INVALIDCODE"
      Then the system should display an error message "Invalid Coupon"
      And the total should remain unchanged

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

  Rule: Review System
    The user must be able to review products they have purchased.

    Example: Successful product review
      Given the user has purchased a "Laptop"
      And the user navigates to the product page of the "Laptop"
      When the user submits a review with the following details:
        """
        Rating: 5
        Comment: Excellent product, highly recommend!
        """
      Then the review should be successfully submitted
      And the review should be visible on the product page

  Rule: Product Filters
    The user must be able to apply filters to refine product searches.

    Example: Filter products by price range
      Given the user is on the search results page for "Smartphones"
      When the user applies a filter for price range "$400 - $600"
      Then the user should see only smartphones within the "$400 - $600" range

    Example: Filter products by brand
      Given the user is on the search results page for "Headphones"
      When the user applies a filter for the brand "Sony"
      Then the user should see only "Sony" branded headphones

  @SmokeTest
  Scenario: View order history
    Given the user navigates to the order history page
    When the user views their past orders
    Then the user should see a list of all previous orders with details like order number, date, and total amount
