@test-demoapp
Feature: Test the selected state of a checkbox
    As a developer
    I want to be able to test the selected state of a checkbox

    Background:
        Given I open the path "/"

    Scenario: The checkbox should not be selected by default
        Then  I expect that the element "#checkbox" is not checked

    Scenario: The checkbox should be checked when clicked
        Given the checkbox "#checkbox" is not checked
        When  I click the element "#checkbox"
        Then  I expect that the element "#checkbox" is checked

    Scenario: The checkbox should deselect when clicked twice
        Given the checkbox "#checkbox" is not checked
        When  I click the element "#checkbox"
        And   I click the element "#checkbox"
        Then  I expect that the element "#checkbox" is not checked
