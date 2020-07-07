@test-webpage
Feature: dropdown list

  As a QA Engineer
  I want to try out dropdown list automation:
    1. click page elements
    2. click page images

  Scenario: Click Drop-Down List - by webelement
    When  I open the url "/"
    Then  I expect that the page title does contain the text "DEMO APP"
    When  I scroll to the element "footer"
    Then  I should see the "Option #1" option on the page
    When  I click the "Option #1" option on the page
    Then  I should see the "Option #2" option on the page

  Scenario: Click Drop-Down List - by tryClick
    When  I open the url "/"
    Then  I expect that the page title does contain the text "DEMO APP"
    When  I scroll to the element "footer"
    Then  I should see the "Option #1" option on the page
    When  I tryClick the 4th element "option" inside the parent element "#selectElementTest" 
    Then  I should see the "Option #4" option on the page

  Scenario: Click Drop-Down List - by deepClick
    When  I open the url "/"
    Then  I expect that the page title does contain the text "DEMO APP"
    When  I scroll to the element "footer"
    Then  I should see the "Option #1" option on the page
    When  I deepClick the 4th element "option" inside the parent element "#selectElementTest" 
    Then  I should see the "Option #4" option on the page

  Scenario: Click Drop-Down List - by image
    Given I open the url "/"
    When  I scroll to the element "footer"
    Then  I should not see the "First_option_Opened:0.6:Second" image on the screen
    Then  I should see the "First_option" image on the screen
    When  I click on the "last-seen" image on the screen
    Then  I should see the "First_option_Opened:0.6:Second" image on the screen
