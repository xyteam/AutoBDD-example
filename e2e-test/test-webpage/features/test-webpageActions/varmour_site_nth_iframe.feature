@test-webpage
@Demo
Feature: vArmour site nth iframe validation and action

  As a QA Engineer
  I want to test see and click images

  Background: open page
    Given  I open the url "https://www.varmour.com/"
    And    I wait on the element ".menu" for 1000ms to be visible
    And    I switch to the parent iframe
    And    I wait on the element "a*=Free Trial" for 5000ms to be visible
    And    I pause for 3000ms
  
  Scenario: Test the nth iframe element visibility and click action
    Then  I expect the element "iframe" does exist at least 4 times
    And   I expect that the element "button#widgetButton" does not exist
    And   I expect that the element "button#widgetCloseButton" does not exist
    And   I switch to the 5th iframe
    And   I wait on the element "button#widgetButton" for 5000ms
    And   I wait on the element "body" for 15000ms to be containing a text
    Then  I expect that the element "body" contains the text "Hi!"
    And   I expect that the element "a*=Free Trial" is not existing
    When  I tryClick the element "button#widgetButton"
    And   I expect that the element "button=Sure!" becomes visible
    And   I expect that the element "button=Nope, I'll explore on my own." becomes visible
    When  I click the element "button=Sure!"
    Then  I expect that the element "button*=talk to a human" becomes visible
    And   I expect that the element "button*=Application Controller" becomes visible
    And   I expect that the element "button*=career" becomes visible
    Then  I expect that the element "button#widgetCloseButton" is visible
    When  I switch to the parent iframe
    Then  I expect that the element "button#widgetCloseButton" is not visible
    And   I expect that the element "a*=Free Trial" becomes visible
