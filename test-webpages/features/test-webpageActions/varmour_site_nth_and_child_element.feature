@test-webpage
@Demo
Feature: vArmour site nth and child element validation and action

  As a QA Engineer
  I want to test see and click images

  Background: open page
    Given  I open the url "https://www.varmour.com/"
  
  Scenario: Test nth web element order and text
    Then  I expect that the element "a=Start Free Trial" becomes visible
    And   I expect the 1st element "li" inside the parent element ".menu" contains the text "Product"
    And   I expect the 2nd element "li" inside the parent element ".menu" contains the text "Virtual Events"
    And   I expect the 3rd element "li" inside the parent element ".menu" contains the text "Blog"
    And   I expect the 4th element "li" inside the parent element ".menu" contains the text "Contact Us"
    And   I expect the 5th element "li" inside the parent element ".menu" contains the text "More"
    And   I expect the element ".btn-wrap" inside the parent element ".menu" contains the text "Free Trial"
    And   I expect that the element "a=Start Free Trial" becomes visible

  Scenario: Test nth web element action
    Then   I expect that the element "a=Start Free Trial" becomes visible
    And   I expect the 4th element "li" inside the parent element ".menu" contains the text "Contact Us"
    When  I click on the 4th element "li" inside the parent element ".menu"
    Then  I expect the url to contain "contact-us"
  
  Scenario: Test scroll to bottom of the page
    Then  I expect that the element "button=Submit" is not visible
    When  I scroll to the element "footer"
    Then  I expect that the element "button=Submit" becomes visible
