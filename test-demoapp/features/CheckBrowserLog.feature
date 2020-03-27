@test-demoapp
Feature: Check browser log
    As a developer
    I want to be able to test browser error log

    Scenario: Check browser log without error
        When  I open the path "/index.html"
        Then  I expect the browser console log should not contain "any error" words
        And   I expect the last browser console SEVERE level log does not appear
        And   I expect the last browser console SEVERE level log does appear exactly 0 time
        And   I announce message at browser: "ENV:LastBrowserLog"

    Scenario: Browser log should display ReferenceError error
        When  I open the path "/jserror.html"
        Then  I expect the browser console SEVERE level log does appear
        And   I expect the last browser console SEVERE level log does not appear more than 1 time
        And   I expect the last browser console log should contain "ReferenceError" words
        And   I announce message at browser: "ENV:LastBrowserLog"
