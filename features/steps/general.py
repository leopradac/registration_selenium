import time
from behave import given, then, use_step_matcher
from selenium.webdriver import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.expected_conditions import visibility_of_element_located
from selenium.webdriver.support.wait import WebDriverWait as Wait

from features.utils import scroll_and_click

use_step_matcher("re")


@given('I open the website (?P<url>.+)')
def open_website(context, url):
    context.driver.get(url)


@then('I resize the window to w(?P<width>[0-9]{1,3}), h(?P<height>[0-9]{1,3})')
def resize_page(context, width, height):
    # context.driver.set_window_size(width, height)
    pass


@then('I start registration')
def home_page(context):
    # open popup
    scroll_and_click(context, '.mt-5 > .v-btn__content')
    # context.driver.find_element(By.CSS_SELECTOR, ".mt-5 > .v-btn__content").click()
    # click on register
    context.driver.find_element(By.CSS_SELECTOR, ".continue > .v-btn__content").click()


# @then('I choose (?P<to_who>myself|someone-else) as "Who"')
@then('at general WHO I select "(?P<to_who>myself|someone-else)"')
def registering_to_who(context, to_who):
    id_dict = {
        'myself': '#who-are-you-0',
        'someone-else': '#who-are-you-1',
    }
    context.driver.find_element(By.CSS_SELECTOR, f"{id_dict[to_who]} > .v-btn__content").click()


@then('I choose (?P<type_of>performer|ro|both) as "Type"')
def type_of_registrant(context, type_of):
    id_dict = {
        'performer': '#who-are-you-0',
        'ro': '#who-are-you-1',
        'both': '#who-are-you-2',
    }
    css_id = id_dict[type_of]
    context.driver.find_element(By.CSS_SELECTOR, f"{css_id} > .v-btn__content").click()
    # checkbox certify 18+
    context.driver.find_element(By.CSS_SELECTOR, ".checkbox-label").click()
    # next
    context.driver.find_element(By.CSS_SELECTOR, ".form-nav-btn").click()


# noinspection SpellCheckingInspection
@then('I fill contact info form')
def general_contact_info(self):
    fname, mname, lname, mail, cmail, phone = self.table[0]
    self.driver.find_element(By.ID, "first-name").send_keys(fname)
    self.driver.find_element(By.ID, "last-name").send_keys(lname)
    self.driver.find_element(By.ID, "email").send_keys(mail)
    self.driver.find_element(By.ID, "email-confirmation").send_keys(cmail)
    self.driver.find_element(By.ID, "phone").send_keys(phone)
    # next
    scroll_and_click(self, '#more-about-you > button')


@then('I fill general contact address')
def general_contact_address(self):
    # open country dropdown
    self.driver.find_element(By.XPATH, "//div[4]/i").click()
    # wait to display options
    Wait(self.driver, 30).until(visibility_of_element_located((By.XPATH, "//div[4]/div/div/div/div/div[2]/div")))
    # select usa
    self.driver.find_element(By.XPATH, "//div[4]/div/div/div/div/div[2]/div").click()
    # type zipcode
    time.sleep(0.5)
    self.driver.find_element(By.CSS_SELECTOR, "[id|=\"zip-code\"]").clear()
    self.driver.find_element(By.CSS_SELECTOR, "[id|=\"zip-code\"]").send_keys("10128", Keys.TAB)
    self.driver.find_element(By.CSS_SELECTOR, "[id|=\"address\"]").send_keys("5th")
    # next
    self.driver.find_element(By.CSS_SELECTOR, ".form-nav-btn").click()
    # popup - use my address
    Wait(self.driver, 30).until(visibility_of_element_located((By.CSS_SELECTOR, ".v-btn--variant-outlined")))
    self.driver.find_element(By.CSS_SELECTOR, ".v-btn--variant-outlined").click()


@then('I check review page and accept it')
def review(self):
    scroll_and_click(self, ".bg-primary")
