import time
from behave import then
from selenium.webdriver.common.by import By
from selenium.webdriver.support.expected_conditions import presence_of_element_located
from selenium.webdriver.support.wait import WebDriverWait as Wait

from features.utils import scroll_and_click


@then('I insert registrant info')
def registrant_info(self):
    # birthdate
    self.driver.find_element(By.XPATH, "//form[@id=\'registrant-info\']/div/div/div/div[3]/input")\
        .send_keys("01/02/1990")
    # gender dropdown
    self.driver.find_element(By.XPATH, "//form[@id=\'registrant-info\']/div[2]/div/div/div[3]/div").click()
    time.sleep(0.5)
    self.driver.find_element(By.CSS_SELECTOR, ".v-list > .v-list-item--link:nth-child(1) .v-list-item-title").click()
    # citizenship dropdown
    self.driver.find_element(By.XPATH, "//div[3]/div/div/div[3]/div/div/span").click()
    time.sleep(0.5)
    self.driver.find_element(By.CSS_SELECTOR, ".v-list > .v-list-item--link:nth-child(1) .v-list-item-title").click()
    # next
    self.driver.find_element(By.CSS_SELECTOR, ".form-nav-btn").click()


@then('I upload the {file} from {location}')
def upload_file(self, file, location):
    Wait(self.driver, 30).until(presence_of_element_located((By.CSS_SELECTOR, ".sx-uploader-container #fileElem")))
    self.driver.find_element(By.CSS_SELECTOR, ".sx-uploader-container #fileElem").send_keys(location)
    Wait(self.driver, 30).until(presence_of_element_located((By.CSS_SELECTOR, "div.v-row:nth-child(5)")))
    self.driver.find_element(By.CSS_SELECTOR, ".form-nav-btn").click()


@then('I add the artist names')
def artist_names(self):
    if self.table:
        for row in self.table:
            self.driver.find_element(By.ID, "solo-name").send_keys(row['name'])
            self.driver.find_element(By.CSS_SELECTOR, ".v-btn__content:nth-child(4)").click()
            time.sleep(1)
    self.driver.find_element(By.CSS_SELECTOR, ".v-btn--variant-outlined").click()


@then('I add the band names')
def band_names(self):
    if self.table:
        for row in self.table:
            if row['name']:
                self.driver.find_element(By.ID, "band-name").send_keys(row['name'])
                self.driver.find_element(By.CSS_SELECTOR, ".v-btn__content:nth-child(4)").click()
                time.sleep(1)
    scroll_and_click(self, '.v-btn--variant-outlined')


@then('I Choose the right owner type as company')
def ro_type(self):
    self.driver.find_element(By.CSS_SELECTOR, "#rights-owner-type-1").click()


@then('I set {name} as ro company name')
def ro_company_name(self, name):
    self.driver.find_element(By.XPATH, "//div[3]/input").send_keys(name)
    scroll_and_click(self, '.form-nav-btn')
