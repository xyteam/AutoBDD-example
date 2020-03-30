@test-demoapp
Feature: Test waiting for actions part 2
    As a developer
    I want to be able to test if delayed actions are being performed

    Background:
        Given I open the url "/"
        And   I pause for 1000ms

    Scenario: Test if element becomes checked after 2000 ms
        Given the checkbox "#waitForCheckedElement" is not checked
        When  I click on the element "#waitForCheckedBtn"
        Then  I wait on element "#waitForCheckedElement" for 2000ms to be checked

    Scenario: Test if element becomes checked with different mouse clicks
        Given the checkbox "#waitForCheckedElement" is not checked
        When  I left click on the element "#waitForCheckedBtn"
        Then  I wait on element "#waitForCheckedElement" for 1000ms to be checked
        When  I left click on the element "#waitForCheckedBtn"
        Then  I wait on element "#waitForCheckedElement" for 1000ms to not be checked
        When  I right click on the element "#waitForCheckedBtn"
        Then  I wait on element "#waitForCheckedElement" for 1000ms to be checked
        When  I right click on the element "#waitForCheckedBtn"
        Then  I wait on element "#waitForCheckedElement" for 1000ms to not be checked
        When  I middle click on the element "#waitForCheckedBtn"
        Then  I wait on element "#waitForCheckedElement" for 1000ms to be checked
        When  I middle click on the element "#waitForCheckedBtn"
        Then  I wait on element "#waitForCheckedElement" for 1000ms to not be checked
        When  I double click on the element "#waitForCheckedBtn"
        Then  I wait on element "#waitForCheckedElement" for 1000ms to not be checked

    Scenario: Test if element becomes enabled
        Given the element "#waitForEnabledElement" is not enabled
        When  I click on the element "#waitForEnabledBtn"
        Then  I wait on element "#waitForEnabledElement" for 1000ms to be enabled

    Scenario: Test if element becomes selected
        Given the element "#waitForSelectedElement option:nth-child(2)" is not selected
        When  I click on the element "#waitForSelectedBtn"
        Then  I wait on element "#waitForSelectedElement option:nth-child(2)" for 1000ms to be selected

    Scenario: Test if element becomes visible
        Given the element "#waitForVisibleElement" is not visible
        When  I click on the element "#waitForVisibleBtn"
        Then  I wait on element "#waitForVisibleElement" for 1000ms to be visible

    Scenario: Test if element to contain a text
        Given the element "#waitForContainsTextElement" not contains any text
        When  I click on the element "#waitForContainsTextBtn"
        Then  I wait on element "#waitForContainsTextElement" for 1000ms to contain a text

    Scenario: Test if element to contain a value
        Given the element "#waitForContainsValueElement" not contains any text
        When  I click on the element "#waitForContainsValueBtn"
        Then  I wait on element "#waitForContainsValueElement" for 1000ms to contain a value
