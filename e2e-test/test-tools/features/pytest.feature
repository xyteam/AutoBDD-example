@test-tools @pytest
Feature: pytest unit tests

  As a QA Engineer
  I want to run the pytest unit tests as a command

  Scenario: run the pytest unit tests
    When I run this command "PIP_BREAK_SYSTEM_PACKAGES=1 pip3 install -q --user -r $PROJECTRUNPATH/py-test/requirement3.txt && cd $PROJECTRUNPATH && python3 -m pytest -r A py-test 2>&1"
    Then the command should succeed
    And  the command output should contain "passed"
