@test-demoapp
Feature: Test input fields can be empty
    As a developer
    I want to be able to test input fields on a certain page

    Background:
        Given I open the path "/"
        Then  I expect that the element "#testInput" value is empty

    Scenario: Set the content of a input field
        When  I set "test" to the inputfield "#testInput"
        Then  I expect that the element "#testInput" value is not empty
        And   I expect that the element "#testInput" contains the value "test"

    Scenario: Add content to a input field
        When  I set "test" to the inputfield "#testInput"
        Then  I expect that the element "#testInput" value is not empty
        When  I add " more tests" to the inputfield "#testInput"
        Then  I expect that the element "#testInput" contains the value "test more tests"

    Scenario: Clear the content of a input field
        When  I set "test" to the inputfield "#testInput"
        Then  I expect that the element "#testInput" value is not empty
        And   I expect that the element "#testInput" contains the value "test"
        When  I clear the inputfield "#testInput"
        Then  I expect that the element "#testInput" value is empty
