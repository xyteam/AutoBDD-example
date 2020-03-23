@test-webpage
@Demo
Feature: See and Click images

  As a QA Engineer
  I want to test see and click images
  
  Scenario: Test web element order and text
    When  I open the url "https://www.varmour.com/"
    And   I expect that the element "a=Start Free Trial" becomes visible
    And   I expect the 1st element "li" inside the parent element ".menu" contains the text "Product"
    And   I expect the 2nd element "li" inside the parent element ".menu" contains the text "Virtual Events"
    And   I expect the 3rd element "li" inside the parent element ".menu" contains the text "Blog"
    And   I expect the 4th element "li" inside the parent element ".menu" contains the text "Contact Us"
    And   I expect the 5th element "li" inside the parent element ".menu" contains the text "More"
    And   I expect the element ".btn-wrap" inside the parent element ".menu" contains the text "Free Trial"
    And   I expect that the element "a=Start Free Trial" becomes visible
    When  I scroll to the element "footer"
    Then  I expect that the element "button=Submit" becomes visible

  Scenario: Test screen image and text
    When  I open the url "https://www.varmour.com/"
    And   I wait every 5 seconds for 1 minute on the screen area to display the regex "v.*m.*r"
    Then  I expect that the "Screen-100" image does contain the regex "Product"
    Then  I expect that the screen area does contain the text "Pssst..."
    And   I should see the "vArmour_logo" image on the screen
    And   I expect that the image "vArmour_logo" does appear exactly 1 time
    And   I expect that the "vArmour_logo" image does match the regex "v.*m.*r"
    And   I should see the "dialogRobot" image on the screen
    And   I expect that the image "dialogRobot" does appear exactly 1 time
    When  I click on the "dialogRobot" image on the screen
    And   I pause for 500ms
    Then  I should see the "robotDialogWindow:0.5:Bot" image on the screen
    And   I expect that the "robotDialogWindow:0.5:Bot" image does match the text "VAR:robotDialogWindowTextRegex"
