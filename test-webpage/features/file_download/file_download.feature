@test-download
Feature: file download

  As a QA Engineer
  I want to open browser to download a few files and investigate file contents

  @SmokeTest
  Scenario: File Open and Download - check PDF file
    When  I open the url "http://www.orimi.com/pdf-test.pdf"
    Then  I should see the "Yukon_Logo" image on the screen
    When  I download the PDF file by clicking "PDF_download_icon"
    And   I open the download file "pdf-test.pdf"
    Then  the downloaded PDF file should contain "PDF Test File"

  Scenario: File Download - check XLS file
    When  I download the XLS file by going to URL "https://file-examples.com/wp-content/uploads/2017/02/file_example_XLS_10.xls"
    Then  the downloaded XLS file should contain 10 rows and 8 columns
    And   the downloaded XLS file at row 0 should contain "First Name"
    And   the downloaded XLS file at row 1 should contain "United States"