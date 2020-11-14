@test-webpage
@Demo
Feature: vArmour site screen text and see and click image

  As a QA Engineer
  I want to test see and click images
  
  Background: open page
    Given  I open the url "https://www.varmour.com/"

  Scenario: Test image wait and text
    And   I pause for 3000ms
    Then  I should see the "FreeTrial" image on the screen
    And   I expect that the "last-seen" image does appear exactly 1 time
    And   I expect that the "last-seen" image does match the regex "free trial"
    And   I expect that the "last-seen" image does mimic the text "Free Trial"

  Scenario: Test screen area text
    And   I wait every 5 seconds for 1 minute on the screen area to display the regex "ACI|SC"
    Then  I expect that the "last-seen" screen area does match the regex "Cisco|Standard Chartered"

  @flicky
  Scenario: Test find image with text
    And   I pause for 3000ms
    Then  I should see the "dialogRobot" image on the screen
    And   I expect that the "last-seen" image does appear exactly 1 time
    When  I click on the "last-seen" image on the screen
    And   I pause for 500ms
    Then  I should see the "robotDialogWindow:0.5:Bot" image on the screen
    And   I expect that the "last-seen" image does match the text "VAR:robotDialogWindowTextRegex"
