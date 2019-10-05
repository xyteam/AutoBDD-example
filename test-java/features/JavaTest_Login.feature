@test-java
Feature: Java Selenium Test Login
    This feature is to test AutoBDD can encapsulate java selenium test scenarios

  Background: Java cucumber project information
    Given I have a java cucumber project "javatest-example"
    And   I have a java cucumber project module "ui"
    And   I have a java cucumber feature file "Login.feature"
 
  Scenario: I login with valid credential
    When  I run the java cucumber scenario "I login with valid credential"
    Then  the java cucumber test should all pass
