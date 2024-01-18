#noinspection SpellCheckingInspection
Feature: Someone Else Feature

  Scenario: Registration someone else/performer
    Given I open the website https://localhost:3000/
    Then the page path should be "/"
    Then I resize the window to w959, h944
    Then I start registration
    Then at general WHO I select "someone-else"
    Then I choose performer as "Type"
    Then I fill contact info form
      | fname | mname | lname     | mail           | cmail          | phone      |
      | Barry |       | Pemberton | mail@gmail.com | mail@gmail.com | 3005556699 |
    Then I fill general contact address
    Then I check review page and accept it
#    registration someone-else
    Given this set of data I will create a registration entity for each
      | fname    | mname | lname        | mail           | mail_c         | date       | gender | residence           | birth       | zip   | state    | artist      | bands   |
      | guyname1 |       | guylastname1 | guy1@gmail.com | guy1@gmail.com | 01/01/1990 | male   | United States - USA | Mexico      | 10128 | New York | art11,art12 | chipuco |
      | guyname2 |       | guylastname2 | guy2@gmail.com | guy2@gmail.com | 02/02/1991 | female | Afghanistan         | Afghanistan |       |          | art21       |         |
    Then at performer-list I add the performer(s) name(s)
    Then I start iterating through the respective forms for a performer
#    payment
#    Then At payment who I select company // not necessary in this flow
    Then At payment/company-name I set soundexchange
    Then I set USA at tax type, S-C and generate