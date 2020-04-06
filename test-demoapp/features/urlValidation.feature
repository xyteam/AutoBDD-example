@test-demoapp
Feature: Test if the url is a certain value
    As a developer
    I want to be able to test if the url is a certain value

    Scenario: The url should not be http://www.google.com/
        Given I open the path "/"
        Then  I expect the full URL to not be "http://www.google.com/"

    Scenario: The url should be baseURL
        Given I open the path "/"
        Then  I expect the URL path to be "/"

    Scenario: The path should not be /index.html
        Given I open the path "/"
        Then  I expect the URL path to not be "/index.html"

    Scenario: The path should be /index.html
        Given I open the path "/index.html"
        Then  I expect the URL path to be "/index.html"

    Scenario: The url should not contain "google"
        Given I open the path "/"
        Then  I expect the full URL to not contain "google"

    Scenario: The url should not contain "index"
        Given I open the path "/index.html"
        Then  I expect the full URL to contain "index"
