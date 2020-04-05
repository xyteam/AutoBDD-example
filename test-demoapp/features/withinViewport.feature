@test-demoapp
Feature: Viewport test
    As a Developer in Test
    I want to test the scrolling and view port relationship.

    Scenario: Header in viewport, footer outside viewport
        Given I open the url "/"
        And   I have a screen that is 1024 by 768 pixels
        And   I pause for 1000ms
        When  I scroll to the element "h1"
        Then  I expect that the element "h1" is within the viewport
        And   I expect that the element "footer" is not within the viewport

    Scenario: Footer in viewport, header outside viewport
        Given I open the url "/"
        And   I have a screen that is 1024 by 768 pixels
        And   I pause for 1000ms
        When  I scroll to the element "footer"
        Then  I expect that the element "footer" is within the viewport
        And   I expect that the element "h1" is not within the viewport
