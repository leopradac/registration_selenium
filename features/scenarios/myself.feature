#noinspection SpellCheckingInspection
Feature: Sample Feature

  Scenario: Registration myself/performer
    Given I open the website https://localhost:3000/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail           | cmail          | phone      |
      | Barry |       | Pemberton | mail@gmail.com | mail@gmail.com | 3005556699 |
    Then I fill general contact address
    Then I check review page and accept it
    Then I insert registrant info
    Then I upload the photo ID from /Users/Shared/sx/upload.png
    Then I add the artist names
      | name     |
      | artist11 |
      | artist22 |
    Then I add the band names
      | name |
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate


  Scenario: Registration myself/both
    Given I open the website https://localhost:3000/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose both as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail           | cmail          | phone      |
      | Barry |       | Pemberton | mail@gmail.com | mail@gmail.com | 3005556699 |
    Then I fill general contact address
    Then I check review page and accept it
    Then I insert registrant info
    Then I upload the photo ID from /Users/Shared/sx/upload.png
    Then I add the artist names
      | name     |
      | artist11 |
      | artist22 |
    Then I add the band names
      | name |
    Then I Choose the right owner type as company
    Then I set Soundexchange as ro company name
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit