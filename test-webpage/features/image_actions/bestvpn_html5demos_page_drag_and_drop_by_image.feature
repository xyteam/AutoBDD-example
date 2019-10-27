@test-webpage
@Demo
Feature: bestvpn html5demos page - drag and drop page by image

  As a QA Engineer
  I want to test bestvpn html5demos page - drag and drop page by image
  
  Scenario: Test bestvpn html5demos page - drag and drop page by image
    When  I open the url "https://bestvpn.org/html5demos/drag/"
    Then  I should see the "target_drop_box" image on the screen
    Given I should see the "NordVPN" image on the screen
    When  I drag "NordVPN" and drop to "target_drop_box"
    And   I hover the "target_drop_box" image on the screen
    Then  I should not see the "NordVPN" image on the screen
    Given I should see the "BestVPN" image on the screen
    When  I drag "BestVPN" and drop to "target_drop_box"
    And   I hover the "target_drop_box" image on the screen
    Then  I should not see the "BestVPN" image on the screen
    Given I should see the "ExpressVPN" image on the screen
    When  I drag "ExpressVPN" and drop to "target_drop_box"
    And   I hover the "target_drop_box" image on the screen
    Then  I should not see the "ExpressVPN" image on the screen
    Given I should see the "UnblockNetflixVPN" image on the screen
    When  I drag "UnblockNetflixVPN" and drop to "target_drop_box"
    And   I hover the "target_drop_box" image on the screen
    Then  I should not see the "UnblockNetflixVPN" image on the screen
    Given I should see the "VPNServices" image on the screen
    When  I drag "VPNServices" and drop to "target_drop_box"
    And   I hover the "target_drop_box" image on the screen
    Then  I should not see the "VPNServices" image on the screen
    And   I should still see the "target_drop_box" image on the screen

  Scenario: Test vArmour web site
    When  I open the url "https://www.varmour.com/"
    Then  I expect the title is "vArmour | Application Security Policy Management"
    Then  I should see the "vArmour_logo" image on the screen
    And   I expect element "a=Start Free Trial" becomes visible
    And   I expect the 1st element "li" inside the parent element ".menu" contains the text "Product"
    And   I expect the 2nd element "li" inside the parent element ".menu" contains the text "Blog"
    And   I expect the 3rd element "li" inside the parent element ".menu" contains the text "Contact Us"
    And   I expect the 4th element "li" inside the parent element ".menu" contains the text "More"
    And   I expect the element ".btn-wrap" inside the parent element ".menu" contains the text "Free Trial"
    And   I expect element "a=Start Free Trial" becomes visible
    And   I expect element "button=Submit" becomes visible
    Then  I should see the "dialogRobot" image on the screen
    When  I click the "dialogRobot" image on the screen
    Then  I should see the "robotDialogWindow" image on the screen
