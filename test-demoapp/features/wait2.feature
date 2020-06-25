@test-demoapp
Feature: Test waiting for actions part 2
    As a developer
    I want to be able to test if delayed actions are being performed

    Background:
        Given I open the url "/"
        And   I pause for 1000ms

    Scenario: Test if element becomes checked with different mouse clicks
        Given the checkbox "#waitForCheckedElement" is not checked
        When  I click on the element "#waitForCheckedBtn"
        And   I wait on the element "#waitForCheckedElement" for 1000ms to be checked
        Then  the checkbox "#waitForCheckedElement" is checked
        When  I left click on the element "#waitForCheckedBtn"
        And   I wait on the element "#waitForCheckedElement" for 1000ms to be not checked
        Then  the checkbox "#waitForCheckedElement" is not checked
        When  I right click on the element "#waitForCheckedBtn"
        Then  the checkbox "#waitForCheckedElement" is not checked
        And   I click the right mouse key
        When  I middle click on the element "#waitForCheckedBtn"
        Then  the checkbox "#waitForCheckedElement" is not checked
        When  I double click on the element "#waitForCheckedBtn"
        And   I wait on the element "#waitForCheckedElement" for 1000ms to be not checked
        Then  the checkbox "#waitForCheckedElement" is not checked
