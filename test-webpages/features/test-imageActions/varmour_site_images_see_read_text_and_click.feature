@test-webpage
@Demo
Feature: vArmour site screen text and see and click image

  As a QA Engineer
  I want to test see and click images
  
  Background: open page
    Given  I open the url "https://www.varmour.com/"

  Scenario: Test screen area text
    And   I wait every 5 seconds for 1 minute on the screen area to display the regex "pssst"
    Then  I expect that the "the last seen" screen area does contain the text "Pssst..."
    And   I expect that the "Screen-100" image does contain the regex "Product"

  Scenario: Test image wait and text
    Then  I should see the "vArmour_logo" image on the screen
    And   I expect that the "the last seen" image does appear exactly 1 time
    And   I expect that the "the last seen" image does match the regex "v.*m.*r"

  Scenario: Test find image with text
    And   I pause for 3000ms
    Then  I should see the "dialogRobot" image on the screen
    And   I expect that the "the last seen" image does appear exactly 1 time
    When  I click on the "the last seen" image on the screen
    And   I pause for 500ms
    Then  I should see the "robotDialogWindow:0.5:Bot" image on the screen
    And   I expect that the "the last seen" image does match the text "VAR:robotDialogWindowTextRegex"
