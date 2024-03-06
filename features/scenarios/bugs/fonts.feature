# Created by leoprada at 30/01/24
Feature: Bugs testing
  # Enter feature description here

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
    Then font-size of element with "p.mb-5:not(:empty)" as selector should be 14px
    Then I check review page and accept it
    Then I insert registrant info
    Then font-size of element with ".form-description" as selector should be 14px
    Then I upload the photo ID from /Users/Shared/sx/upload.png
    Then font-size of element with "p.mb-5:not(:empty)" as selector should be 14px
    Then I add the artist names
      | name     |
      | artist11 |
      | artist22 |
    Then font-size of element with "p.mb-5:not(:empty)" as selector should be 14px
    Then I add the band names
      | name |
    Then At payment who I select company
    Then font-size of element with ".v-label--clickable" as selector should be 14px
    Then font-size of element with ".checkbox-top .v-label--clickable" as selector should be 14px
    Then At payment/company-name I set soundexchange
    Then font-size of element with ".description>p" as selector should be 14px
    Then I set USA at tax type, S-C and upload
    #    test resume
    Then I resume the process on a new tab
    Then the page path should be "/registration/payment/tax-form/w9/company"
    #    finish resume