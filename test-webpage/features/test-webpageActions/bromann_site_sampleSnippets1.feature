@test-demoapp
Feature: Sample Snippets test part 1
    As a developer
    I should be able to use given text snippets

    #@Isolate
    Scenario: open URL
        Given the page url is not "http://webdriverjs.christian-bromann.com/"
        And   I open the url "http://webdriverjs.christian-bromann.com/"
        Then  I expect the full URL to be "http://webdriverjs.christian-bromann.com/"
        And   I expect the full URL to not be "http://google.com"

    Scenario: open sub page of weburl
        Given the page url is not "http://webdriverjs.christian-bromann.com/two.html"
        And   I open the url "http://webdriverjs.christian-bromann.com/"
        Then  I expect the full URL to be "http://webdriverjs.christian-bromann.com/"
        And   I expect the full URL to not be "http://google.com"

    Scenario: click on link
        Given the page title does not equal the text "two"
        And   I open the url "http://webdriverjs.christian-bromann.com/"
        When  I click on the link "two"
        Then  I expect that the page title does equal the text "two"

    Scenario: click on button
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the element ".btn1_clicked" is not visible
        When  I click on the button ".btn1"
        Then  I expect that the element ".btn1_clicked" is visible

    Scenario: double click on a button
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the element ".btn1_dblclicked" is not visible
        When  I double click on the element ".btn1"
        Then  I expect that the element ".btn1_dblclicked" is visible

    Scenario: click on element
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the element ".btn1_clicked" is not visible
        When  I click on the element ".btn1"
        Then  I expect that the element ".btn1_clicked" is visible

    Scenario: add value to an input element
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the element "//html/body/section/form/input[1]" not contains the value "abc"
        When  I add "bc" to the inputfield "//html/body/section/form/input[1]"
        Then  I expect that the element "//html/body/section/form/input[1]" contains the value "abc"

    Scenario: set value to an input element
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the element "//html/body/section/form/input[1]" not contains the value "bc"
        When  I set "bc" to the inputfield "//html/body/section/form/input[1]"
        Then  I expect that the element "//html/body/section/form/input[1]" contains the value "bc"

    Scenario: clear value of input element
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        When  I set "test" to the inputfield "//html/body/section/form/input[1]"
        And   I clear the inputfield "//html/body/section/form/input[1]"
        Then  I expect that the element "//html/body/section/form/input[1]" not contains any text

    Scenario: drag n drop
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the element ".searchinput" not contains the value "Dropped!"
        When  I drag element "#overlay" to element ".red"
        Then  I expect that the element ".searchinput" contains the value "Dropped!"

    Scenario: submit form
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   there is no element ".gotDataA" on the page
        When  I submit the form ".send"
        Then  I expect that the element ".gotDataA" is visible

    Scenario: wait for element
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   there is no element ".lateElem" on the page
        Then  I wait on element ".lateElem" for 5000ms to be visible

    Scenario: wait for element using default wait time
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   there is no element ".lateElem" on the page
        Then  I wait on element ".lateElem" to be visible

    Scenario: pause
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   there is no element ".lateElem" on the page
        When  I pause for 3000ms
        Then  I expect that the element ".lateElem" is visible
