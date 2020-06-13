@test-demoapp
Feature: Test form submission
    As a developer
    I want to be able to test form submission

    Background:
        Given I open the path "/"

    Scenario: Test if a message is shown when the form is submitted
        Given the element "#formSubmitTest .message" is not visible
        When  I click on the element "button=Submit"
        Then  I expect that the element "#formSubmitTest .message" is visible
