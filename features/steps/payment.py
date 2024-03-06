import time

from behave import then, use_step_matcher
from selenium.common import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.expected_conditions import visibility_of_element_located
from selenium.webdriver.support.wait import WebDriverWait as Wait

from features.utils import scroll_and_click, scroll_and_type

use_step_matcher("re")


@then('At payment who I select (?P<who>company|individual)')
def payment_who(self, who):
    id_dict = {
        'individual': 'payment-who-0',
        'company': 'payment-who-1',
    }
    css_id = id_dict[who]
    self.driver.find_element(By.ID, css_id).click()


@then('At payment/company-name I set (?P<name>.+)')
def company_name(self, name):
    self.driver.find_element(By.XPATH, "//div[3]/input").send_keys(name)
    # checkbox
    inputs = self.driver.find_elements(By.CSS_SELECTOR, ".v-input")
    inputs[2].click()
    scroll_and_click(self, ".form-nav-btn")


@then('At payment/company-name/ro-only I set (?P<name>.+)')
def company_name(self, name):
    self.driver.find_element(By.CSS_SELECTOR, "input.v-field__input").send_keys(name)
    scroll_and_click(self, ".form-nav-btn")


@then('I set USA at tax type, S-C and (?P<action>generate|upload|none)')
def tax_type_usa(self, action):
    css_dict = {
        'generate': '#tax-type-0',
        'upload': '#tax-type-1',
        'none': '#tax-type-2',
    }
    # country dropdown
    self.driver.find_element(By.XPATH, "//div/div/div[3]/div").click()
    Wait(self.driver, 30).until(visibility_of_element_located(
        (By.CSS_SELECTOR, ".v-list > .v-list-item--link:nth-child(1) .v-list-item-title")
    ))
    self.driver.find_element(By.CSS_SELECTOR, ".v-list > .v-list-item--link:nth-child(1) .v-list-item-title").click()
    # classification
    self.driver.find_element(By.XPATH, "//div[2]/div/div/div/div/div/div[3]/div").click()
    Wait(self.driver, 30).until(visibility_of_element_located(
        (By.CSS_SELECTOR, ".v-list > .v-list-item--link:nth-child(1) .v-list-item-title")
    ))
    self.driver.find_element(By.CSS_SELECTOR, ".v-list > .v-list-item--link:nth-child(1) .v-list-item-title").click()
    # generate, upload or omit
    self.driver.find_element(By.CSS_SELECTOR, css_dict[action]).click()
    # next
    scroll_and_click(self, ".form-nav-btn")
    if action == 'none':
        self.driver.find_element(By.CSS_SELECTOR, '.sx-modal-container button.bg-primary').click()


# noinspection DuplicatedCode
@then('I type (?P<country>.+) at tax type, (?P<classification>nothing|s-c|partnership|trust|c-c|llc c|llc s) at class'
      ' and (?P<action>generate|upload|none) at action')
def tax_type_fill_form(self, country, classification, action):
    action_dict = {
        'generate': '#tax-type-0',
        'upload': '#tax-type-1',
        'none': 'button[id^="tax-type"]:last-child',
    }
    # country dropdown
    scroll_and_type(self, 'input', country)
    # classification
    if classification != 'nothing':
        self.driver.find_elements(By.CSS_SELECTOR, "input")[1].send_keys(classification)
    # generate, upload or none
    self.driver.find_element(By.CSS_SELECTOR, action_dict[action]).click()
    # next
    scroll_and_click(self, ".form-nav-btn")
    if action == 'none':
        self.driver.find_element(By.CSS_SELECTOR, '.sx-modal-container button.bg-primary').click()


@then('At payment/method i choose (?P<method>deposit|check)')
def payment_method(self, method):
    id_dict = {
        'deposit': 'payment-method-0',
        'check': 'payment-method-1',
    }
    self.driver.find_element(By.ID, id_dict[method]).click()


@then('At payment/direct-deposit I fill the form (?P<popup>with popup|without popup)')
def direct_deposit(self, popup):
    bank, account, routing, email, email_c = self.table[0]
    self.driver.find_element(By.CSS_SELECTOR, '#bankName').send_keys(bank)
    self.driver.find_element(By.CSS_SELECTOR, '#accountNumber').send_keys(account)
    self.driver.find_element(By.CSS_SELECTOR, '#routingNumber').send_keys(routing)
    self.driver.find_element(By.CSS_SELECTOR, '#emailAddress').send_keys(email)
    self.driver.find_element(By.CSS_SELECTOR, '#confirmEmailAddress').send_keys(email_c)
    scroll_and_click(self, ".form-nav-btn")
    if popup == 'with popup':
        scroll_and_click(self, ".modal-content button.bg-primary")


# noinspection DuplicatedCode
@then('At payment/direct-deposit I fill the form and choose AUTH s.e at POPUP')
def direct_deposit(self):
    bank, account, routing, email, email_c = self.table[0]
    self.driver.find_element(By.CSS_SELECTOR, '#bankName').send_keys(bank)
    self.driver.find_element(By.CSS_SELECTOR, '#accountNumber').send_keys(account)
    self.driver.find_element(By.CSS_SELECTOR, '#routingNumber').send_keys(routing)
    self.driver.find_element(By.CSS_SELECTOR, '#emailAddress').send_keys(email)
    self.driver.find_element(By.CSS_SELECTOR, '#confirmEmailAddress').send_keys(email_c)
    scroll_and_click(self, ".form-nav-btn")
    # select auth someone else from popup
    scroll_and_click(self, ".modal-content .popup-btn-secondary")


@then('At payment/direct-deposit/contact-info I click next, without address popup')
def direct_deposit_contact_info(self):
    scroll_and_click(self, ".form-nav-btn")


@then('At payment/direct-deposit/contact-info I confirm suggested address')
def direct_deposit_contact_info(self):
    scroll_and_click(self, ".form-nav-btn")
    # use suggested address
    scroll_and_click(self, "#confirm-modal button.bg-primary")


@then('at w9Wizard I set (?P<tax_number>.+) as taxId')
def w9_wizard(self, tax_number):
    self.driver.find_element(By.CSS_SELECTOR, '#taxId').send_keys(tax_number)
    scroll_and_click(self, ".form-nav-btn")


@then('at w9Verify I click next')
def w9_verify(self):
    time.sleep(5)
    scroll_and_click(self, ".form-nav-btn")


@then('at w9Signature I sign with (?P<signature>.+)')
def w9_signature(self, signature):
    self.driver.find_element(By.CSS_SELECTOR, '#electronicSignature').send_keys(signature)
    scroll_and_click(self, ".form-nav-btn")


@then('at w9Success I click next')
def w9_success(self):
    time.sleep(2)
    scroll_and_click(self, ".form-nav-btn")


@then('at review-and-submit I sign as (?P<signature>.+) and click submit')
def review_and_submit(context, signature):
    scroll_and_type(context, '#signature', signature)
    scroll_and_click(context, 'button.primary-btn')


@then('at membership for RO I sign as (?P<signature>.+) and click next')
def membership(context, signature):
    scroll_and_type(context, '#roSign', signature)
    scroll_and_click(context, '.form-nav-btn')


@then('at mandate-intro I click next')
def mandate_intro(context):
    scroll_and_click(context, '.form-nav-btn')


@then('at mandate-opt-in for RO I sign as (?P<signature>.+) and click next')
def mandate_intro(context, signature):
    scroll_and_type(context, '#rightsOwnerSign', signature)
    scroll_and_click(context, 'button.bg-primary')
