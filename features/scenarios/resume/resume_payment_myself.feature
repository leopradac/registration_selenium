#noinspection SpellCheckingInspection
@payment-resume
@myself-payment-resume
Feature: MYSELF | Payment resume Feature

  Scenario: Payment who resume
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    #    test resume
    Then I resume the process on a new tab
    Then the page path should be "/registration/payment/who"
#    finish resume


  Scenario: Payment name resume
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    #    test resume
    Then I resume the process on a new tab
    Then the page path should be "/registration/payment/who"
#    finish resume


  Scenario: Payment tax-type (generate) resume
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate
    #    test resume
    Then I resume the process on a new tab
    Then the page path should be "/registration/payment/method"
    #    finish resume


  Scenario: Payment tax-type (upload) resume
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and upload
    #    test resume
    Then I resume the process on a new tab
    Then the page path should be "/registration/payment/tax-form/w9/company"
    #    finish resume


  Scenario: Payment tax-type (none) resume
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and none
    Then the page path should be "/registration/payment/method"
    #    test resume
    Then I resume the process on a new tab
    #  this fails: takes back to method
    Then the page path should be "/registration/payment/method"
    #    finish resume


  @deposit-contact-info
  Scenario: Payment direct-deposit/contact-info resume -to direct-deposit-
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form without popup
      | bank            | account   | routing   | email                  | email_c                |
      | bank of america | 123456789 | 021000021 | lxprada@athenaworks.io | lxprada@athenaworks.io |
    Then At payment/direct-deposit/contact-info I click next, without address popup
    #    test resume
    Then I resume to "/registration/payment/direct-deposit"


  @auth-form
  Scenario: Payment till auth-form - resume
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form and choose AUTH s.e at POPUP
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I click next, without address popup
    Then I upload the auth-form from /Users/Shared/sx/upload.png
    #    test resume
    Then I resume to "/registration/payment/upload-check"


  Scenario: Payment till upload-check done - resume to method
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form and choose AUTH s.e at POPUP
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I click next, without address popup
    Then I upload the auth-form from /Users/Shared/sx/upload.png
    Then I upload the upload-check from /Users/Shared/sx/upload.png
    #    test resume
    Then I resume to "/registration/payment/w9-wizard/tax-id/company"


  @upload-check
  Scenario: Payment till upload-check done - resume to w9-wizard
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form and choose AUTH s.e at POPUP
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I click next, without address popup
    Then I upload the auth-form from /Users/Shared/sx/upload.png
    Then I upload the upload-check from /Users/Shared/sx/upload.png
    #    test resume
    Then I resume to "/registration/payment/w9-wizard/tax-id/company"


  Scenario: Payment till w9-wizard/tax-info done - resume to w9-wizard/tax-info
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form and choose AUTH s.e at POPUP
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I click next, without address popup
    Then I upload the auth-form from /Users/Shared/sx/upload.png
    Then I upload the upload-check from /Users/Shared/sx/upload.png
    Then at w9Wizard I set 76-0742496 as taxId
    #    test resume
    Then I resume to "/registration/payment/w9-wizard/tax-id/company"


  Scenario: Payment till w9-w/verify done - resume to w9-w/tax-info
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form and choose AUTH s.e at POPUP
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I click next, without address popup
    Then I upload the auth-form from /Users/Shared/sx/upload.png
    Then I upload the upload-check from /Users/Shared/sx/upload.png
    Then at w9Wizard I set 76-0742496 as taxId
    Then at w9Verify I click next
    #    test resume
    Then I resume to "/registration/payment/w9-wizard/verify"


  Scenario: Payment till w9-w/signature done - resume to w9-w/tax-info
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form and choose AUTH s.e at POPUP
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I click next, without address popup
    Then I upload the auth-form from /Users/Shared/sx/upload.png
    Then I upload the upload-check from /Users/Shared/sx/upload.png
    Then at w9Wizard I set 76-0742496 as taxId
    Then at w9Verify I click next
    Then at w9Signature I sign with SX
    #    test resume
    Then I resume to "/registration/payment/w9-wizard/verify"


  Scenario: Payment till w9-w/success done - resume to w9-w/tax-info
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail                   | cmail                  | phone      |
      | Barry |       | Pemberton | lxprada@athenaworks.io | lxprada@athenaworks.io | 3005556699 |
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
    Then At payment who I select company
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form and choose AUTH s.e at POPUP
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I click next, without address popup
    Then I upload the auth-form from /Users/Shared/sx/upload.png
    Then I upload the upload-check from /Users/Shared/sx/upload.png
    Then at w9Wizard I set 76-0742496 as taxId
    Then at w9Verify I click next
    Then at w9Signature I sign with SX
    Then at w9Success I click next
    #    test resume
    Then I resume to "/registration/payment/w9-wizard/verify"


  Scenario: Registration myself/rights-owner till w9/success - RESUME
    Given I open the website https://localhost:3000/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose ro as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail           | cmail          | phone      |
      | Barry |       | Pemberton | mail@gmail.com | mail@gmail.com | 3005556699 |
    Then I fill general contact address and use suggested address
      | zipcode | address |
      | 10128   | 5th     |
    Then I check review page and accept it
    Then I Choose the right owner type as company
    Then I set Soundexchange as ro company name
    Then At payment who I select company
    Then the page path should be "/registration/payment/company-name/ro-only"
    Then At payment/company-name/ro-only I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form without popup
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I click next, without address popup
    Then I upload the upload-check from /Users/Shared/sx/upload.png
    Then at w9Wizard I set 76-0742496 as taxId
    Then at w9Verify I click next
    Then at w9Signature I sign with SX
    Then at w9Success I click next
    Then the page path should be "/registration/payment/photo-id/ro-only/self"
    #    test resume
    Then I resume to "/registration/payment/w9-wizard/verify"



  Scenario: Registration myself/rights-owner [company] till photo-id done - RESUME
    Given I open the website https://localhost:3000/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose ro as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail           | cmail          | phone      |
      | Barry |       | Pemberton | mail@gmail.com | mail@gmail.com | 3005556699 |
    Then I fill general contact address and use suggested address
      | zipcode | address |
      | 10128   | 5th     |
    Then I check review page and accept it
    Then I Choose the right owner type as company
    Then I set Soundexchange as ro company name
    Then At payment who I select company
    Then the page path should be "/registration/payment/company-name/ro-only"
    Then At payment/company-name/ro-only I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form without popup
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I click next, without address popup
    Then I upload the upload-check from /Users/Shared/sx/upload.png
    Then at w9Wizard I set 76-0742496 as taxId
    Then at w9Verify I click next
    Then at w9Signature I sign with SX
    Then at w9Success I click next
    Then I upload the photo-id/ro-only from /Users/Shared/sx/upload.png
    Then the page path should be "/registration/review-and-submit"
    #    test resume
    #    this should send to verify but currently resume is not getting the photo id data
    Then I resume to "/registration/payment/w9-wizard/verify"



  Scenario: Registration myself/rights-owner [individual] till payment who done - RESUME
    Given I open the website https://localhost:3000/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose ro as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail           | cmail          | phone      |
      | Barry |       | Pemberton | mail@gmail.com | mail@gmail.com | 3005556699 |
    Then I fill general contact address and use suggested address
      | zipcode | address |
      | 10128   | 5th     |
    Then I check review page and accept it
    Then I Choose the right owner type as individual and click next
    Then At payment who I select individual
    Then the page path should be "/registration/payment/individual-name"
    #    test resume
    #    this should send to verify but currently resume is not getting the photo id data
    Then I resume to "/registration/payment/w9-wizard/verify"


    Scenario: Registration myself/rights-owner [individual] till photo-id done - RESUME
    Given I open the website https://localhost:3000/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose ro as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail           | cmail          | phone      |
      | Barry |       | Pemberton | mail@gmail.com | mail@gmail.com | 3005556699 |
    Then I fill general contact address and use suggested address
      | zipcode | address |
      | 10128   | 5th     |
    Then I check review page and accept it
    Then I Choose the right owner type as individual and click next
    Then At payment who I select company
    Then the page path should be "/registration/payment/company-name/ro-only"
    Then At payment/company-name/ro-only I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form without popup
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I click next, without address popup
    Then I upload the upload-check from /Users/Shared/sx/upload.png
    Then at w9Wizard I set 76-0742496 as taxId
    Then at w9Verify I click next
    Then at w9Signature I sign with SX
    Then at w9Success I click next
    Then I upload the photo-id/ro-only from /Users/Shared/sx/upload.png
    Then the page path should be "/registration/review-and-submit"
    #    test resume
    #    this should send to verify but currently resume is not getting the photo id data
    Then I resume to "/registration/payment/w9-wizard/verify"


  Scenario: MS, R-O, Pay foreign till final confirmation screen - RESUME
    Given I open the website https://localhost:3000/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "myself"
    Then I choose ro as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail           | cmail          | phone      |
      | Barry |       | Pemberton | mail@gmail.com | mail@gmail.com | 3005556699 |
    Then I fill general contact address and use suggested address
      | zipcode | address |
      | 10128   | 5th     |
    Then I check review page and accept it
    Then I Choose the right owner type as individual and click next
    Then At payment who I select company
    Then the page path should be "/registration/payment/company-name/ro-only"
    Then At payment/company-name/ro-only I set soundexchange
    Then I type afghanistan at tax type, nothing at class and none at action
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form without popup
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I click next, without address popup
    Then I upload the upload-check from /Users/Shared/sx/upload.png
    Then I upload the photo-id/ro-only from /Users/Shared/sx/upload.png
    Then the page path should be "/registration/review-and-submit"
    Then at review-and-submit I sign as Lp and click submit
    Then at membership for RO I sign as roLP and click next
    Then at mandate-intro I click next
    Then at mandate-opt-in for RO I sign as optInRo and click next
    Then I resume to "/registration/payment/w9-wizard/verify"