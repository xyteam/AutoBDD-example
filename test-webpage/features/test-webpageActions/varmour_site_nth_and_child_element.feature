@test-webpage
@Demo
Feature: vArmour site nth and child element validation and action

  As a QA Engineer
  I want to test see and click images

  Background: open page
    Given  I open the url "https://www.varmour.com/"
    And    I wait on the element ".menu" for 1000ms to be visible
  
  Scenario: Test the nth web element order and text
    Then  I expect that the element "a=Start Free Trial" becomes visible
    And   I expect the 1st element "li" inside the parent element ".menu" contains the text "Product"
    And   I expect the 2nd element "li" inside the parent element ".menu" contains the text "Virtual Events"
    And   I expect the 3rd element "li" inside the parent element ".menu" contains the text "Blog"
    And   I expect the 4th element "li" inside the parent element ".menu" contains the text "Contact Us"
    And   I expect the 5th element "li" inside the parent element ".menu" contains the text "More"
    And   I expect the element ".btn-wrap" inside the parent element ".menu" contains the text "Free Trial"
    And   I expect that the element "a=Start Free Trial" becomes visible

  Scenario: Test the nth web element action
    Then  I expect that the element "a=Start Free Trial" becomes visible
    And   I expect the 4th element "li" inside the parent element ".menu" contains the text "Contact Us"
    When  I click the 4th element "li" inside the parent element ".menu"
    And   I pause for 500ms
    And   I switch to the last opened tab
    And   I pause for 500ms
    Then  I should see the "vArmour_ContactUs:0.8:Contact" image on the screen

  Scenario: Test tab action
    When  I click the element "li=Contact Us" inside the parent element ".menu"
    And   I pause for 500ms
    And   I switch to the last opened tab
    Then  I should see the "vArmour_ContactUs:0.8:Contact" image on the screen
    And   I close the last opened tab
    Then  I should not see the "vArmour_ContactUs:0.8:Contact" image on the screen
