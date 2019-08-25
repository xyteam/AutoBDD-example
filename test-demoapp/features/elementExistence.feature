Feature: Test existence of elements
    As a developer
    I want to be able to test the existence of a element

    Background:
        Given I open the path "/"

    Scenario: None existing element check
        Then  I expect that element "#noneExisting" does not exist

    Scenario: Existing element check
        Then  I expect that element "#exisiting" does exist

    Scenario: Existing element count check
        Then  I expect that element "input" does appear exactly "8" times

    Scenario: Existing element inside parent element count check
        Then  I expect that element "div" does appear inside parent element "//div[@style]" exactly "2" times