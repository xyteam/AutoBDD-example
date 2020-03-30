@test-demoapp
Feature: Test waiting for actions part 1
    As a developer
    I want to be able to test if delayed actions are being performed

    Background:
        Given I open the url "/"
        And   I pause for 1000ms

    Scenario: Test if element to exist
        Given there is no element "#waitForCreateElement > span" on the page
        When  I click on the element "#waitForCreateBtn"
        Then  I wait on element "#waitForCreateElement > span" for 1000ms

    Scenario: Test if element exists
        Given there is no element "#waitForCreateElement > span" on the page
        When  I click on the element "#waitForCreateBtn"
        Then  I wait on element "#waitForCreateElement > span" for 1000ms to exist

    Scenario: Test if element becomes unchecked
        When  I click on the element "#waitForCheckedBtn"
        And   I pause for 1000ms
        Then  I expect that the checkbox "#waitForCheckedElement" is checked
        When  I click on the element "#waitForCheckedBtn"
        Then  I wait on element "#waitForCheckedElement" for 1000ms to not be checked

    Scenario: Test if element becomes disabled
        When  I click on the element "#waitForEnabledBtn"
        And   I pause for 1000ms
        Then  I expect that the element "#waitForEnabledElement" is enabled
        When  I click on the element "#waitForEnabledBtn"
        Then  I wait on element "#waitForEnabledElement" for 1000ms to not be enabled

    Scenario: Test if element becomes not selected
        When  I click on the element "#waitForSelectedBtn"
        And   I pause for 1000ms
        Then  I expect that the element "#waitForSelectedElement option:nth-child(2)" is selected
        When  I click on the element "#waitForSelectedBtn"
        Then  I wait on element "#waitForSelectedElement option:nth-child(2)" for 1000ms to not be selected

    Scenario: Test if element becomes not visible
        When  I click on the element "#waitForVisibleBtn"
        And   I pause for 1000ms
        Then  I expect that the element "#waitForVisibleElement" is visible
        When  I click on the element "#waitForVisibleBtn"
        Then  I wait on element "#waitForVisibleElement" for 1000ms to not be visible

    Scenario: Test if element to not contain a text
        When  I click on the element "#waitForContainsTextBtn"
        And   I pause for 1000ms
        Then  I expect that the element "#waitForContainsTextElement" contains any text
        When  I click on the element "#waitForContainsTextBtn"
        Then  I wait on element "#waitForContainsTextElement" for 1000ms to not contain a text

    Scenario: Test if element to not contain a value
        When  I click on the element "#waitForContainsValueBtn"
        And   I pause for 1000ms
        Then  I expect that the element "#waitForContainsValueElement" contains any value
        When  I click on the element "#waitForContainsValueBtn"
        Then  I wait on element "#waitForContainsValueElement" for 2000ms to not contain a value

    Scenario: Test if element not exists
        When  I click on the element "#waitForCreateBtn"
        And   I pause for 1000ms
        Then  I expect that the element "#waitForCreateElement > span" does exist
        When  I click on the element "#waitForCreateBtn"
        Then  I wait on element "#waitForCreateElement > span" for 1000ms to not exist
