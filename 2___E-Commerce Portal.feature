Feature: E-Commerce Portal

  As a registered user,
  I want to browse products, add them to the cart, and complete purchases,
  So that I can buy products from the e-commerce portal.

  Scenario: Search for a product by name
    Given the user enters "Laptop" in the search bar
    When the user clicks the search button
    Then the user should see a list of laptops
    And the user should see the "Filters" option to refine the search

  Scenario: Add product to cart
    Given the user is on the product details page of a "Laptop"
    When the user clicks the "Add to Cart" button
    Then the product should be added to the shopping cart
    And the cart icon should display the correct quantity of items