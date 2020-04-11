@test-download
Feature: File download and validation

  As a QA Engineer
  I want to open browser to download a few files and investigate file contents

  @SmokeTest
  Scenario: Open url, check content, download file and check downloaded content - PDF file
    Given I delete all download files with the name "pdf-test.*"
    When  I open the url "http://www.orimi.com/pdf-test.pdf"
    Then  I should see the "Yukon_Logo" image on the screen
    And   I park mouse at the center position of the screen
    And   I hover mouse at the 0,100 position of the screen
    And   I click on the "PDF_download_icon" image on the screen
    And   I pause for 1000ms
    And   I click on the "FileSave_button:0.5:Save" image on the screen
    And   I wait on download file "pdf-test.pdf" for 5000ms to exist
    And   I open the download file "pdf-test.pdf"
    Then  I expect the downloaded file "pdf-test.pdf" contains exactly 18 lines
    And   I expect the downloaded file "pdf-test.pdf" contains more than 10 lines
    And   I expect the downloaded file "pdf-test.pdf" contains less than 20 lines
    And   I expect the downloaded file "pdf-test.pdf" at line 4 contains the text "PDF Test File"
    And   I expect the downloaded file "pdf-test.pdf" not contains the text "PDF Tast File"
    And   I expect the downloaded file "pdf-test.pdf" matches the text "Box \d{4}"

  Scenario: Download and check file - XLS file
    Given I delete all download files with the name "file_example_XLS_10*"
    When  I open the url "https://file-examples.com/wp-content/uploads/2017/02/file_example_XLS_10.xls"
    And   I wait on download file "file_example_XLS_10.xls" for 5000ms to exist
    And   I announce message: "I have downloaded file_example_XLS_10.xls to ENV:DownloadPathLocal"
    And   I announce message at browser: "I have downloaded file_example_XLS_10.xls to ENV:DownloadPathLocal"
    Then  I expect the downloaded file "file_example_XLS_10.xls" contains 10 rows
    And   I expect the downloaded file "file_example_XLS_10.xls" contains 10 rows and 8 columns
    And   I expect the downloaded file "file_example_XLS_10.xls" at row 0 contains the text "0,First Name,Last Name,Gender,Country,Age,Date,Id"
    And   I expect the downloaded file "file_example_XLS_10.xls" at row 1 and column 4 equals the text "United States"

  Scenario: Browse directory and open file - PNG file
    Given I open the file "ENV:PROJECTRUNPATH"
    And   I click the element "a=test-webpages/"
    And   I click the element "a=testimages/"
    And   I click the element "a=Yukon_Logo.png"
    Then  I should see the "Yukon_Logo" image on the screen
