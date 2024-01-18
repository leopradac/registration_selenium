from behave import then, use_step_matcher
from selenium.webdriver.common.by import By
from selenium.webdriver.support.expected_conditions import visibility_of_element_located
from selenium.webdriver.support.wait import WebDriverWait as Wait

from features.utils import scroll_and_click

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
    inputs = self.driver.find_elements(By.CSS_SELECTOR, ".v-input")
    inputs[2].click()
    scroll_and_click(self, ".form-nav-btn")


@then('I set USA at tax type, S-C and generate')
def tax_type_usa(self):
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
    self.driver.find_element(By.CSS_SELECTOR, "#tax-type-0 > .v-btn__content").click()
    # next
    scroll_and_click(self, ".form-nav-btn")


@then('At payment/method i choose (?P<method>deposit|check)')
def payment_method(self, method):
    id_dict = {
        'deposit': 'payment-method-0',
        'check': 'payment-method-1',
    }
    self.driver.find_element(By.ID, id_dict[method]).click()


@then('At payment/direct-deposit I fill the form')
def direct_deposit(self):
    bank, account, routing, email, email_c = self.table[0]
    self.driver.find_element(By.CSS_SELECTOR, '.v-form > input')
