@test-demoapp
Feature: Github test
    As a Developer in Test
    I want to search for webdriverio repository
    So that I can use it in my future tests

Scenario: open URL
    Given I open the url "https://github.com/"
    Then  I expect the URL host to be "github.com"
    And   I expect that the page title does contain the text "GitHub"

Scenario: check elements existing
    Given I open the url "https://github.com/webdriverio/cucumber-boilerplate"
    Then  I expect that the element ".octicon-mark-github" does exist
    And   I expect that the element ".octicon-mark-github" does exist exactly 2 times
    And I expect that the element ".some-other-element" does not exist

Scenario: search for webdriverio repository
    Given I open the url "https://github.com/search"
    And   I clear the inputfield "[placeholder='Search GitHub']"
    And   the element "[placeholder='Search GitHub']" not contains any value
    And   I click the element "[placeholder='Search GitHub']"
    And   I add "webdriverio" to the inputfield "[placeholder='Search GitHub']"
    And   I add " " to the inputfield "[placeholder='Search GitHub']"
    And   I add "selenium" to the inputfield "[placeholder='Search GitHub']"
    Then  I expect that the element "[placeholder='Search GitHub']" contains the value "webdriverio selenium"
    When  I click the element "button=Search"
    Then  I expect that the element ".repo-list-item:first-child" contains the text "webdriverio"
    And   I expect that the element ".repo-list-item:last-child" matches the regex "selenium"

Scenario: login with fake credentials
    Given I open the url "https://github.com/login"
    And   I clear the inputfield "#login_field"
    When  I add "marketionist" to the inputfield "#login_field"
    And   I clear the inputfield "#password"
    And   I add "1111" to the inputfield "#password"
    And   I click on the button "//*[@value='Sign in']"
    Then  I expect that the element "#js-flash-container .flash-error" is visible
