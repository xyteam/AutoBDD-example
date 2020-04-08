@test-webpage
@Demo
Feature: vArmour site nth and child element validation and action

  As a QA Engineer
  I want to test see and click images

  Background: open page
    Given  I open the url "https://www.varmour.com/"
    And    I wait on element ".menu" for 1000ms to be visible
  
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
    And   I focus the last opened tab
    And   I pause for 500ms
    Then  I should see the "vArmour_ContactUs:0.8:Contact" image on the screen

  Scenario: Test tab action
    When  I click the element "li=Contact Us" inside the parent element ".menu"
    And   I focus the last opened tab
    And   I pause for 500ms
    Then  I should see the "vArmour_ContactUs:0.8:Contact" image on the screen
    And   I close the last opened tab
    Then  I should not see the "vArmour_ContactUs:0.8:Contact" image on the screen

  Scenario: Test the nth iframe action
    And   I pause for 5000ms
    Then  I expect that the element "button#widgetCloseButton" is not visible
    And   I expect the element "iframe" does exist exactly 6 times
    And   I switch to the 4th iframe
    Then  I expect that the element "body" contains the text "Pssst… want to see how our platform helps CISOs"
    When  I click on the element "button"
    And   I expect that the element "button=Sure!" becomes visible
    And   I expect that the element "button=Nope, I'll explore on my own." becomes visible
    When  I click on the element "button=Sure!"
    Then  I expect that the element "button=Yes!" becomes visible
    And   I expect that the element "button=No, thanks." becomes visible
    Then  I expect that the element "button#widgetCloseButton" is visible
    When  I switch to the parent iframe
    Then  I expect that the element "button#widgetCloseButton" is not visible