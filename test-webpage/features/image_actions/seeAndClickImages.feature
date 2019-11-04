@test-webpage
@Demo
Feature: See and Click images

  As a QA Engineer
  I want to test see and click images
  
  Scenario: Test vArmour web site
    When  I open the url "https://www.varmour.com/"
    Then  I expect the title is "vArmour | Application Security Policy Management"
    Then  I should see the "vArmour_logo" image on the screen
    And   I expect element "a=Start Free Trial" becomes visible
    And   I expect the 1st element "li" inside the parent element ".menu" contains the text "Product"
    And   I expect the 2nd element "li" inside the parent element ".menu" contains the text "Blog"
    And   I expect the 3rd element "li" inside the parent element ".menu" contains the text "Contact Us"
    And   I expect the 4th element "li" inside the parent element ".menu" contains the text "More"
    And   I expect the element ".btn-wrap" inside the parent element ".menu" contains the text "Free Trial"
    And   I expect element "a=Start Free Trial" becomes visible
    And   I expect element "button=Submit" becomes visible
    Then  I should see the "dialogRobot" image on the screen
    When  I click the "dialogRobot" image on the screen
    And   I pause for 1000ms
    Then  I should see the "robotDialogWindow" image on the screen
