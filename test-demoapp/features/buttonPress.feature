@test-demoapp
Feature: Test button press
    As a developer
    I want to be able to test if a certain action is performed when a certain
    button is pressed

    Background:
        Given I open the path "/"
        And   I click on the "Dropzone" image on the screen

    Scenario: Test if element responds to button press
        Given the element "#testKeyResponse" not contains any text
        When  I press the "a" key to the screen
        Then  I expect that the element "#testKeyResponse" contains the text "65"

    Scenario: Test if element responds to button press
        Given the element "#testKeyResponse" not contains any text
        When  I press the "b" key to the screen
        Then  I expect that the element "#testKeyResponse" not contains the text "65"

    # Escape key
    Scenario: Test if element responds to button press
        Given the element "#testKeyResponse" not contains any text
        When  I press the "escape" key to the screen
        Then  I expect that the element "#testKeyResponse" contains the text "27"
