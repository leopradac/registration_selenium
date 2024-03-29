#noinspection SpellCheckingInspection
Feature: Register Someone Else

  Scenario: As performer. Payment company. Generate. Deposit.
    Given I open the website https://localhost:3000/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "someone-else"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail           | cmail          | phone      |
      | Barry |       | Pemberton | mail@gmail.com | mail@gmail.com | 3005556699 |
    Then I fill general contact address and use suggested address
      | zipcode | address |
      | 10128   | 5th     |
    Then the page path should be "/registration/general/review"
    Then font-size of element with "p.mb-5:not(:empty)" as selector should be 14px
    Then I check review page and accept it
#    registration someone-else
    Given this set of data I will create a registration entity for each
      | fname    | mname | lname        | mail           | mail_c         | date       | gender | residence           | birth       | zip   | state    | artist      | bands   |
      | guyname1 |       | guylastname1 | guy1@gmail.com | guy1@gmail.com | 01/01/1990 | male   | United States - USA | Mexico      | 10128 | New York | art11,art12 | chipuco |
      | guyname2 |       | guylastname2 | guy2@gmail.com | guy2@gmail.com | 02/02/1991 | female | Afghanistan         | Afghanistan |       |          | art21       |         |
    Then font-size of element with ".form-description" as selector should be 14px
    Then font-size of element with "input#first-name" as selector should be 16px
    Then at performer-list I add the performer(s) name(s)
    Then I start iterating through the respective forms for a performer
#    payment
#    Then At payment who I select company // not necessary in this flow
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate
    Then At payment/method i choose deposit
    Then At payment/direct-deposit I fill the form with popup
      | bank            | account   | routing   | email          | email_c        |
      | bank of america | 123456789 | 021000021 | mail@gmail.com | mail@gmail.com |
    Then At payment/direct-deposit/contact-info I confirm suggested address
    Then I upload the voided-check from /Users/Shared/sx/upload.png
    Then at w9Wizard I set 76-0742496 as taxId
#    Then at w9Verify I click next
#    Then at w9Signature I sign with L.P.


  Scenario: As right-owner.
    Given I open the website https://localhost:3000/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "someone-else"
    Then I choose ro as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail           | cmail          | phone      |
      | Barry |       | Pemberton | mail@gmail.com | mail@gmail.com | 3005556699 |
    Then I fill general contact address and use suggested address
      | zipcode | address |
      | 10128   | 5th     |
    Then I check review page and accept it
    Then I Choose the right owner type as individual


  Scenario: As both
    Given I open the website https://localhost:3000/
#    Given I open the website https://registration1.uat.soundexchange.com/
    Then the page path should be "/"
#    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "someone-else"
    Then I choose both as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail           | cmail          | phone      |
      | Barry |       | Pemberton | mail@gmail.com | mail@gmail.com | 3005556699 |
    Then I fill general contact address and use suggested address
      | zipcode | address |
      | 10128   | 5th     |
    Then the page path should be "/registration/general/review"
    Then I check review page and accept it
#    registration someone-else
    Given this set of data I will create a registration entity for each
      | fname    | mname | lname        | mail           | mail_c         | date       | gender | residence           | birth       | zip   | state    | artist      | bands   |
      | guyname1 |       | guylastname1 | guy1@gmail.com | guy1@gmail.com | 01/01/1990 | male   | United States - USA | Mexico      | 10128 | New York | art11,art12 | chipuco |
    Then font-size of element with ".form-description" as selector should be 14px
    Then font-size of element with "input#first-name" as selector should be 16px
    Then at performer-list I add the performer(s) name(s)
    Then I start iterating through the respective forms for a performer
    Then I Choose the right owner type as individual
#    payment
#    Then At payment who I select company // not necessary in this flow
    Then At payment/company-name I set soundexchange
