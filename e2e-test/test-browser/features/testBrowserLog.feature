@test-table
Feature: Test browser log
    As a developer
    I want to be able to test browser error log

    Scenario: Test browser log without error
        When  I open the path "/index.html"
        Then  I expect the browser console log should not contain "any error" words
        And   I expect the last browser console SEVERE level log does not exist
        And   I expect the last browser console SEVERE level log does exist exactly 0 time
        And   I announce message at browser: "ENV:LastBrowserLog"

    Scenario: Browser log should display ReferenceError error
        When  I open the path "/jserror.html"
        Then  I expect the browser console SEVERE level log does exist
        And   I expect the last browser console SEVERE level log does exist at least 1 time
        And   I expect the last browser console log should contain "ReferenceError" words
        And   I announce message at browser: "ENV:LastBrowserLog"
