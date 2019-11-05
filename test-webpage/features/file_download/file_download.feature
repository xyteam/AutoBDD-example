@test-download
Feature: file download

  As a QA Engineer
  I want to open browser to download a few files and investigate file contents

  @SmokeTest
  Scenario: File Open and Download - check PDF file
    Given I delete all download files with the name "pdf-test.*"
    When  I open the url "http://www.orimi.com/pdf-test.pdf"
    Then  I should see the "Yukon_Logo" image on the screen
    When  I download the PDF file by clicking "PDF_download_icon"
    And   I open the download file "pdf-test.pdf"
    Then  I expect the downloaded file "pdf-test.pdf" contains exactly 18 lines
    And   I expect the downloaded file "pdf-test.pdf" contains more than 10 lines
    And   I expect the downloaded file "pdf-test.pdf" contains less than 20 lines
    And   I expect the downloaded file "pdf-test.pdf" contains the text "PDF Test File"
    And   I expect the downloaded file "pdf-test.pdf" not contains the text "PDF Tast File"
    And   I expect the downloaded file "pdf-test.pdf" matches the text "Box \d{4}"

  Scenario: File Download - check XLS file
    Given I delete all download files with the name "file_example_XLS.*"
    When  I download the XLS file by going to URL "https://file-examples.com/wp-content/uploads/2017/02/file_example_XLS_10.xls"
    Then  I expect the downloaded file "file_example_XLS_10.xls" contains 10 rows
    And   I expect the downloaded file "file_example_XLS_10.xls" contains 10 rows and 8 columns
    And   I expect the downloaded file "file_example_XLS_10.xls" at line 0 contains the text "First Name"
    And   I expect the downloaded file "file_example_XLS_10.xls" at line 1 contains the text "United States"
