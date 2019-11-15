@test-demoapp
Feature: Test existence of elements
    As a developer
    I want to be able to test the existence of a element

    Background:
        Given I open the path "/"

    Scenario: None existing element check
        Then  I expect that the element "#noneExisting" does not exist

    Scenario: Existing element check
        Then  I expect that the element "#exisiting" does exist

    Scenario: Existing element count check
        Then  I expect the element "input" does exist exactly 8 times

    Scenario: Existing element inside parent element count check
        Then  I expect the element "div" inside the parent element "//div[@style]" does exist exactly 2 times
