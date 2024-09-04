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