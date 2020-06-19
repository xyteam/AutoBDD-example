@test-demoapp
Feature: Test waiting for actions part 1
    As a developer
    I want to be able to test if delayed actions are being performed

    Background:
        Given I open the url "/"
        And   I pause for 1000ms

    Scenario: Test element wait
        Given there is no element "#waitForCreateElement > span" on the page
        When  I click the element "#waitForCreateBtn"
        And   I wait on element "#waitForCreateElement > span" for 1000ms
        Then  there is an element "#waitForCreateElement > span" on the page

    Scenario: Test wait for element to exist
        Given there is no element "#waitForCreateElement > span" on the page
        When  I click the element "#waitForCreateBtn"
        And   I wait on element "#waitForCreateElement > span" for 1000ms to be existing
        Then  there is an element "#waitForCreateElement > span" on the page

    Scenario: Test wait for element to be enabled
        Given the element "#waitForEnabledElement" is not enabled
        When  I click the element "#waitForEnabledBtn"
        And   I wait on element "#waitForEnabledElement" for 1000ms to be enabled
        Then  the element "#waitForEnabledElement" is enabled

    Scenario: Test wait for element to be visible
        Given the element "#waitForVisibleElement" is not visible
        When  I click the element "#waitForVisibleBtn"
        And   I wait on element "#waitForVisibleElement" for 1000ms to be visible
        Then  the element "#waitForVisibleElement" is visible
        When  I click the element "#waitForVisibleBtn"
        And   I wait on element "#waitForVisibleElement" for 1000ms to be not visible
        Then  the element "#waitForVisibleElement" is not visible

    Scenario: Test wait for element to be checked
        Given the element "#waitForCheckedElement" is not checked
        When  I click the element "#waitForCheckedBtn"
        Then  I wait on element "#waitForCheckedElement" for 1000ms to be checked
        And   I expect that the element "#waitForCheckedElement" is checked
        When  I click the element "#waitForCheckedBtn"
        Then  I wait on element "#waitForCheckedElement" for 1000ms to be not checked
        And   I expect that the element "#waitForCheckedElement" is not checked

    Scenario: Test wait for element to be selected
        Given the element "#waitForSelectedElement option:nth-child(2)" is not checked
        When  I click the element "#waitForSelectedBtn"
        Then  I wait on element "#waitForSelectedElement option:nth-child(2)" for 1000ms to be selected
        Then  I expect that the element "#waitForSelectedElement option:nth-child(2)" is selected
        When  I click the element "#waitForSelectedBtn"
        Then  I wait on element "#waitForSelectedElement option:nth-child(2)" for 1000ms to be not selected
        And   I expect that the element "#waitForSelectedElement option:nth-child(2)" is not selected

    Scenario: Test wait for element to be containing a text
        Given the element "#waitForContainsTextElement" text is empty
        When  I click the element "#waitForContainsTextBtn"
        And   I wait on element "#waitForContainsTextElement" for 1000ms to be containing a text
        Then  the element "#waitForContainsTextElement" text is not empty

    Scenario: Test wait for element to be containing a value
        Given the element "#waitForContainsValueElement" value is empty
        When  I click the element "#waitForContainsValueBtn"
        And   I wait on element "#waitForContainsValueElement" for 2000ms to be containing a value
        Then  the element "#waitForContainsValueElement" value is not empty