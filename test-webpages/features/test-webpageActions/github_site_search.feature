@test-demoapp
Feature: Github test
    As a Developer in Test
    I want to search for webdriverio repository
    So that I can use it in my future tests

Scenario: open URL
    Given I open the url "https://github.com/"
    Then  I expect the URL host to be "github.com"
    And   I expect that the title is "The world’s leading software development platform · GitHub"

Scenario: search for webdriverio repository
    Given I open the url "https://github.com/search"
    And   I clear the inputfield "[placeholder='Search GitHub']"
    And   the element "[placeholder='Search GitHub']" not contains any value
    And   I click on the element "[placeholder='Search GitHub']"
    And   I add "webdriverio" to the inputfield "[placeholder='Search GitHub']"
    And   I add " " to the inputfield "[placeholder='Search GitHub']"
    And   I add "selenium" to the inputfield "[placeholder='Search GitHub']"
    Then  I expect that the element "[placeholder='Search GitHub']" contains the value "webdriverio selenium"
    When  I click on the element "button=Search"
    Then  I expect that the element ".repo-list-item:first-child" contains the text "webdriverio"
    And   I expect that the element ".repo-list-item:first-child" contains the text "selenium"
