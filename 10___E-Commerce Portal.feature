Feature: E-Commerce Portal

  As a registered user,
  I want to browse products, add them to the cart, and complete purchases,
  So that I can buy products from the e-commerce portal.

  Background:
    Given the user is logged into the e-commerce portal
    And the user is on the homepage

  @storykey = BD-1 #[Link the story]
  @testcasekey = BD-TC-1 #[Update the Test case]
  @SmokeTest
  Scenario: Search for a product by name
    Given the user enters "Laptop" in the search bar
    When the user clicks the search button
    Then the user should see a list of laptops
    And the user should see the "Filters" option to refine the search