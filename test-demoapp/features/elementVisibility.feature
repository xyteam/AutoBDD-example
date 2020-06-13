@test-demoapp
Feature: Test visibility of elements
    As a developer
    I want to be able to test the visibillity of a element

    Background:
        Given I open the url "/"
        And   I pause for 1000ms

    Scenario: Invisible elements to be invisible
        Then  I expect that the element "#hidden" is not visible

    Scenario: Visible elements to be visible
        Then  I expect that the element "#visible" is visible

    Scenario: Element should become visible
        Given the element "#makeVisible" is not visible
        When  I click the element "#btnMakeVisible"
        Then  I expect that the element "#makeVisible" becomes visible

    Scenario: Element should become invisible
        Given the element "#makeInvisible" is visible
        When  I click the element "#btnMakeInvisible"
        And   I pause for 1000ms
        Then  I expect that the element "#makeInvisible" becomes not visible

    Scenario: Element in the viewport
        When  I scroll to the element "h1"
        Then  I expect that the element "h1" is within the viewport

    Scenario: Element outside the viewport
        When  I scroll to the element "#footer"
        Then  I expect that the element "h1" is not within the viewport
