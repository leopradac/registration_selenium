@payment-resume
@someone-else-payment-resume
Feature: SOMEONE-ELSE | Payment resume Feature

  Scenario: As performer. Payment company. RESUME to payment name.
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
    Then the page path should be "/registration/payment/company-name/multiple-performers"
    Then At payment/company-name I set soundexchange
    Then I resume to "/registration/payment/company-name/multiple-performers"


  Scenario: As rights-owner. RESUME to payment name.
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
    Then the page path should be "/registration/general/review"
    Then font-size of element with "p.mb-5:not(:empty)" as selector should be 14px
    Then I check review page and accept it
#    registration someone-else
    Then the page path should be "/registration/registration/rights-owner/type"
    Then I resume to "/registration/registration/rights-owner/type"
