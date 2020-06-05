@test-table

Feature: test table rows and columns
    As a developer
    I want to be test table rows and columns

    Background: open table and assign expected values
        Given I open the path "/jstable.html"
        And   I expect that the element "h1" becomes visible
        And   I expect that the element "#firm_table" becomes visible
        And   I expect that the element ".expected .rows" contains the text "6 rows"
        And   I expect that the element ".expected .columns" contains the text "5 columns"
        And   I assign the number from the element ".expected .rows" as "expectedRows"
        And   I assign the number from the element ".expected .columns" as "expectedColumns"

    Scenario: check expected table rows and columns
        Then  I expect that the element "tbody tr" does exist exactly ENV:expectedRows times
        And   I expect that the element "tbody td" inside the 1st parent element "tbody tr" does exist exactly ENV:expectedColumns times

    Scenario: check downloaded table csv rows and columns
        Given I delete all download files with the name "table_*.csv"
        When  I click on the element "button=Export to"
        And   I click on the element "li=CSV"
        And   I wait on download file "table_*.csv" for 5000ms to exist
        Then  I expect that the downloaded file "table_*.csv" contains exactly ENV:expectedRows data rows and exactly ENV:expectedColumns columns

    Scenario: check downloaded table json rows and columns
        Given I delete all download files with the name "table_*.json"
        When  I click on the element "button=Export to"
        And   I click on the element "li=JSON"
        And   I wait on download file "table_*.json" for 5000ms to exist
        Then  I expect that the downloaded file "table_*.json" contains exactly ENV:expectedRows data rows and exactly ENV:expectedColumns columns
        And   I expect that all data entries in the downloaded json file "table_*.json" conform to the template file "testTable_template.json"