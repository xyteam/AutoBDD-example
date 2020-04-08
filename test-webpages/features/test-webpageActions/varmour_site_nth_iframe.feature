@test-webpage
@Demo
Feature: vArmour site nth iframe validation and action

  As a QA Engineer
  I want to test see and click images

  Background: open page
    Given  I open the url "https://www.varmour.com/"
    And    I wait on element ".menu" for 1000ms to be visible
    And    I switch to the parent iframe
    And    I wait on element "a=Start Free Trial" for 5000ms to be visible
    And    I pause for 3000ms
  
  Scenario: Test the nth iframe element visibility and click action
    Then  I expect the element "iframe" does exist no less than 4 times
    And   I expect that the element "button#widgetButton" is not visible
    And   I expect that the element "button#widgetCloseButton" is not visible
    And   I switch to the 4th iframe
    And   I wait on element "button#widgetButton" for 5000ms to be visible
    Then  I expect that the element "html body" contains the text "Pssst… want to see how our platform helps CISOs"
    And   I expect that the element "a=Start Free Trial" is not visible
    When  I click on the element "button"
    And   I expect that the element "button=Sure!" becomes visible
    And   I expect that the element "button=Nope, I'll explore on my own." becomes visible
    When  I click on the element "button=Sure!"
    Then  I expect that the element "button=Yes!" becomes visible
    And   I expect that the element "button=No, thanks." becomes visible
    Then  I expect that the element "button#widgetCloseButton" is visible
    When  I switch to the parent iframe
    Then  I expect that the element "button#widgetCloseButton" is not visible
    And   I expect that the element "a=Start Free Trial" becomes visible
