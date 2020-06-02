@test-webpage
@Demo
Feature: bestvpn site - drag and drop image

  As a QA Engineer
  I want to test bestvpn html5demos page - drag and drop page by image
  
  Scenario: Test bestvpn html5demos page - drag and drop page by image
    When  I open the url "https://bestvpn.org/html5demos/drag/"
    Then  I should see the "target_drop_box" image on the screen
    Given I should see the "NordVPN:0.9" image on the screen
    When  I drag "NordVPN:0.9" and drop to "target_drop_box"
    And   I hover on the "target_drop_box" image on the screen
    Then  I should not see the "NordVPN:0.9" image on the screen
    # Given I should see the "BestVPN:0.9" image on the screen
    # When  I drag "BestVPN:0.9" and drop to "target_drop_box"
    # And   I hover on the "target_drop_box" image on the screen
    # Then  I should not see the "BestVPN:0.9" image on the screen
    # Given I should see the "ExpressVPN:0.9" image on the screen
    # When  I drag "ExpressVPN:0.9" and drop to "target_drop_box"
    # And   I hover on the "target_drop_box" image on the screen
    # Then  I should not see the "ExpressVPN:0.9" image on the screen
    # Given I should see the "UnblockNetflixVPN:0.9" image on the screen
    # When  I drag "UnblockNetflixVPN:0.9" and drop to "target_drop_box"
    # And   I hover on the "target_drop_box" image on the screen
    # Then  I should not see the "UnblockNetflixVPN:0.9" image on the screen
    # Given I should see the "VPNServices" image on the screen
    # When  I drag "VPNServices" and drop to "target_drop_box"
    # And   I hover on the "target_drop_box" image on the screen
    # Then  I should not see the "VPNServices" image on the screen
    # And   I should still see the "target_drop_box" image on the screen
