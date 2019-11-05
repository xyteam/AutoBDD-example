@test-demoapp
Feature: Test draggable elements
    As a developer
    I want to be able to test a given draggable element

    Background:
        Given I open the path "/"
        And   I have a screen that is 1024 by 768 pixels
        And   I scroll to element "head"
        And   I expect that the element "#draggable" is visible
        And   I expect that the element "#droppable" is visible
        # Then  I expect that the element "#draggable" is positioned at 30.5px on the x axis
        # And   I expect that the element "#draggable" is positioned at 130px on the y axis
        # And   I expect that the element "#droppable" is positioned at 130px on the y axis

    Scenario: Drag to dropzone
        When  I drag element "#draggable" to element "#droppable"
        Then  I expect that the element "#droppable" contains the text "Dropped!"
        # And   I expect that the element "#draggable" is not positioned at 30.5px on the x axis
        # And   I expect that the element "#draggable" is positioned at 180px on the y axis
