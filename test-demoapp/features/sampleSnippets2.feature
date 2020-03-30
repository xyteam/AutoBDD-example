@test-demoapp
Feature: Sample Snippets test part 2
    As a developer
    I should be able to use given text snippets

    Scenario: query title
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the title is "WebdriverJS Testpage"
        And   the title is not "Other title"
        Then  I expect that the title is "WebdriverJS Testpage"
        And   I expect that the title is not "Other title"

    Scenario: check visibility
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the element ".btn1" is visible
        And   the element ".btn1_clicked" is not visible
        Then  I expect that the element ".btn1" is visible
        And   I expect that the element ".btn1_clicked" is not visible

    Scenario: compare texts
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the element "#secondPageLink" contains the same text as element "#secondPageLink"
        And   the element "#secondPageLink" contains not the same text as element "#githubRepo"
        Then  I expect that the element "#secondPageLink" contains the same text as element "#secondPageLink"
        And   I expect that the element "#secondPageLink" not contains the same text as element "#githubRepo"

    Scenario: check text content
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the element "#secondPageLink" contains the text "two"
        And   the element "#secondPageLink" not contains the text "andere linktext"
        Then  I expect that the element "#secondPageLink" contains the text "two"
        And   I expect that the element "#secondPageLink" not contains the text "anderer linktext"

    Scenario: check input content
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the element "//html/body/section/form/input[1]" contains the value "a"
        And   the element "//html/body/section/form/input[1]" not contains the value "aa"
        Then  I expect that the element "//html/body/section/form/input[1]" contains the value "a"
        And   I expect that the element "//html/body/section/form/input[1]" not contains the value "aa"

    Scenario: check attribut
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the attribute "data-foundby" from element "#newWindow" is "partial link text"
        And   the attribute "data-foundby" from element "#newWindow" is not "something else"
        Then  I expect that the attribute "data-foundby" from element "#newWindow" is "partial link text"
        And   I expect that the attribute "data-foundby" from element "#newWindow" is not "something else"

    Scenario: check css attribut
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the css attribute "background-color" from element ".red" is "rgba(255,0,0,1)"
        And   the css attribute "background-color" from element ".red" is not "rgba(0,255,0,1)"
        Then  I expect that the css attribute "background-color" from element ".red" is "rgba(255,0,0,1)"
        And   I expect that the css attribute "background-color" from element ".red" is not "rgba(0,255,0,1)"

    Scenario: check width and height
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the element ".red" is 102px broad
        And   the element ".red" is 102px tall
        And   the element ".red" is not 103px broad
        And   the element ".red" is not 103px tall
        Then  I expect that the element ".red" is 102px broad
        And   I expect that the element ".red" is 102px tall
        And   I expect that the element ".red" is not 103px broad
        And   I expect that the element ".red" is not 103px tall

    # For some reason this test is failing when running it in the Travis VM
    @Pending
    Scenario: check offset
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the element ".red" is positioned at 15px on the x axis
        And   the element ".red" is positioned at 242px on the y axis
        And   the element ".red" is not positioned at 16px on the x axis
        And   the element ".red" is not positioned at 243px on the y axis
        Then  I expect that the element ".red" is positioned at 15px on the x axis
        And   I expect that the element ".red" is positioned at 242px on the y axis
        And   I expect that the element ".red" is not positioned at 16px on the x axis
        And   I expect that the element ".red" is not positioned at 243px on the y axis

    Scenario: check selected
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the checkbox ".checkbox_notselected" is not checked
        When  I click on the element ".checkbox_notselected"
        Then  I expect that the checkbox ".checkbox_notselected" is checked

    # This will fail in PhantoJS due to a security warning
    @Pending
    Scenario: set / read cookie
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the cookie "test" does not exist
        When  I set a cookie "test" with the content "test123"
        Then  I expect that the cookie "test" exists
        And   I expect that the cookie "test" contains "test123"
        And   I expect that the cookie "test" not contains "test1234"

    # This will fail in PhantoJS due to a security warning
    @Pending
    Scenario: delete cookie
        Given I open the url "http://webdriverjs.christian-bromann.com/"
        And   the cookie "test" does exist
        When  I delete the cookie "test"
        Then  I expect that the cookie "test" not exists
