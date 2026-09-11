@test-tools @k6
Feature: k6 performance test

  As a QA Engineer
  I want to run the k6 performance test as a command

  Scenario: run the k6 performance test
    When I run this command "cd $PROJECTRUNPATH/k6-test && k6 run performance-test.js 2>&1"
    Then the command should succeed
    And  the command output should contain "http_req_duration"
