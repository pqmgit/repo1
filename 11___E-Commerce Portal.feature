Feature: E-Commerce Portal

  As a registered user,
  I want to view the order history

  Background:
    Given the user is logged into the e-commerce portal
    And the user is on the homepage

  @storykey = BD-1 #[current project Link the story]
  @storykey = BD-1 #[cross projec Link the story]
  @testcasekey = BD-TC-1 #[Update the Test case]
  @SmokeTest
  Scenario: View order history
    Given the user navigates to the order history page
    When the user views their past orders
    Then the user should see a list of all previous orders with details like order number, date, and total amount