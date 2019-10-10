@test-demoapp
Feature: Test input fields on a page
    As a developer
    I want to be able to test input fields on a certain page

    Background:
        Given I open the path "/"
        Then  I expect that element "#testInput" not contains any value

    Scenario: Set the content of a input field
        When  I set "test" to the inputfield "#testInput"
        Then  I expect that element "#testInput" contains some value
        And   I expect that element "#testInput" contains the value "test"

    Scenario: Add content to a input field
        When  I set "test" to the inputfield "#testInput"
        Then  I expect that element "#testInput" contains some value
        When  I add " more tests" to the inputfield "#testInput"
        Then  I expect that element "#testInput" contains the value "test more tests"

    Scenario: Clear the content of a input field
        When  I set "test" to the inputfield "#testInput"
        Then  I expect that element "#testInput" contains some value
        And   I expect that element "#testInput" contains the value "test"
        When  I clear the inputfield "#testInput"
        Then  I expect that element "#testInput" not contains any value
