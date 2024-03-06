#noinspection SpellCheckingInspection
Feature: Myself Feature

  Scenario: Registration myself/performer
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                  | cmail                 | phone      |
      | Barry |       | Pemberton | lprada@athenaworks.io | lprada@athenaworks.io | 3005556699 |
    Then I fill general contact address and use suggested address
      | zipcode | address |
      | 10128   | 5th     |
    Then I check review page and accept it
    Then I insert registrant info
#    test resume
    Then I resume the process on a new tab
    Then the page path should be "/registration/registration/registrant-info"
    Then I click continue
#    finish resume
    Then I upload the photo ID from /Users/Shared/sx/upload.png
    Then I add the artist names
      | name     |
      | artist11 |
      | artist22 |
    Then I add the band names
      | name |
    Then At payment who I select company
    #    test resume
    Then I resume the process on a new tab
    Then the page path should be "/registration/payment/who"
    Then I click continue
#    finish resume
    Then At payment/company-name I set soundexchange

    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form with popup
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I confirm suggested address
    Then I upload the voided-check from /Users/Shared/sx/upload.png
    Then at w9Wizard I set 76-0742496 as taxId


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
    Then I fill general contact address and use suggested address
      | zipcode | address |
      | 10128   | 5th     |
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
    Then I resume to "/registration/payment/method"



