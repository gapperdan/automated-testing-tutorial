Feature: Searching for products on the Newegg website

Scenario: Go to the Newegg website and search for a product
    Given I open the browser and go to Newegg homepage
    When I search for Mazinger Z
    Then I should see a list of products related to Mazinger Z