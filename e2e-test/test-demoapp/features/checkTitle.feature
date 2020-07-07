@test-demoapp
Feature: Local server test
    As a developer
    I want the demo app have the correct title

    Background:
        Given I open the path "/"

    Scenario: Is not Google
        Then I expect that the page title does not equal the text "Google"

    Scenario: Is correct
        Then I expect that the page title does equal the text "DEMO APP"
