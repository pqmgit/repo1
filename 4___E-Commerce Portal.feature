Feature: E-Commerce Portal

  As a registered user,
  I want to browse products, add them to the cart, and complete purchases,
  So that I can buy products from the e-commerce portal.

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