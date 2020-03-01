@test-webpage
@SmokeTest
Feature: demoapp drag and drop

  As a QA Engineer
  I want to test the demoapp drag and drop feature by webelement and by image

  Scenario: Drag to dropzone - by webelement
    When  I open the url "http://localhost:8082"
    And   I scroll to the element "head"
    Then  I expect that the element "#draggable" is visible
    And   I expect that the element "#droppable" is visible
    When  I drag element "#draggable" to element "#droppable"
    Then  I expect that the element "#droppable" contains the text "Dropped!"

  Scenario: Drag to dropzone - by image
    When  I open the url "http://localhost:8082"
    And   I scroll to the element "head"
    Then  I should see the "Drag_me" image on the screen
    And   I expect that the "Drag_me" image does contain the text "Drag me!"
    And   I should see the "Dropzone" image on the screen
    And   I expect that the "Dropzone" image does contain the text "Dropzone"
    When  I drag "Drag_me" and drop to "Dropzone"
    Then  I should still see the "Drag_me" image on the screen
    Then  I should not see the "Dropzone" image on the screen
