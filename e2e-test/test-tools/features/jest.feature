@test-tools @jest
Feature: jest unit tests

  As a QA Engineer
  I want to run the jest unit tests as a command

  Scenario: run the jest unit tests
    When I run this command "cd $PROJECTRUNPATH/js-test && npm install --silent && node_modules/.bin/jest --verbose . 2>&1"
    Then the command should succeed
    And  the command output should contain "Tests:"
    And  the command output should contain "passed"
