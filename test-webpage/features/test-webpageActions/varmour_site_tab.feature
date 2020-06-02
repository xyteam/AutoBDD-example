@test-webpage
@Demo
Feature: vArmour site tab validation and action

  As a QA Engineer
  I want to test see and click images

  Background: open page
    Given  I open the url "https://www.varmour.com/"
    And    I wait on element ".menu" for 1000ms to be visible
  
  Scenario: Test tab action
    When  I click the element "li=Contact Us" inside the parent element ".menu"
    And   I focus the last opened tab
    And   I pause for 500ms
    Then  I should see the "vArmour_ContactUs:0.8:Contact" image on the screen
    And   I close the last opened tab
    Then  I should not see the "vArmour_ContactUs:0.8:Contact" image on the screen

