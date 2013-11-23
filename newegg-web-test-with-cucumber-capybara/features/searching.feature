Feature: As as customer, I want to go the Newegg website and search for a product I'm interested in

@searching
Scenario: Go to the Newegg website and search for a product
    Given I open the browser and go to Newegg homepage
    When I search for Mazinger Z
    Then I should see a list of products related to Mazinger Z

@navigating
Scenario: Go to the Newegg website and use the navigation menus to go the Mac Software page
    Given I open the browser and go to Newegg homepage
    When I use the navigation menu and select the category Software>Mac Software
    Then I should be on the Mac Software page