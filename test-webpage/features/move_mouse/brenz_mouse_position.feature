@test-webpage
@Demo
Feature: brenz.net mouse tracker page

  As a QA Engineer
  I want to test brenz.net mouse tracker page
  
  Scenario: brenz.net mouse tracker page
    Given I open the url "http://www.brenz.net/snippets/xy.asp"
    When  I park mouse at "center"
    Then  I expect mouse at "center"
    When  I park mouse at "180,100"
    Then  I expect mouse at "180,100"
    When  I park mouse at "upperLeft"
    Then  I expect mouse at "upperLeft"
    When  I park mouse at "upperRight"
    Then  I expect mouse at "upperRight"
    When  I park mouse at "lowerLeft"
    Then  I expect mouse at "lowerLeft"
    When  I park mouse at "lowerRight"
    Then  I expect mouse at "lowerRight"
    When  I park mouse at "1800,1000"
    Then  I expect mouse at "1800,1000"
    When  I park mouse at "center"
    Then  I expect mouse at "center"
