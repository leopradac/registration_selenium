import json
import os.path
import time

from selenium.webdriver.common.by import By


def scroll_and_click(context, css_selector):
    element = context.driver.find_element(By.CSS_SELECTOR, css_selector)
    context.driver.execute_script("arguments[0].scrollIntoView();", element)
    time.sleep(1)
    element.click()
    return element


def scroll_and_type(context, css_selector, text):
    element = context.driver.find_element(By.CSS_SELECTOR, css_selector)
    context.driver.execute_script("arguments[0].scrollIntoView();", element)
    element.send_keys(text)
    return element


def get_registration_uuid(self):
    script = "return sessionStorage.getItem('general');"
    value = self.driver.execute_script(script)
    parsed = json.loads(value)
    return parsed['registrationData']['uuid']


def get_resume_url(self):
    url = self.base_url
    uuid = get_registration_uuid(self)
    return os.path.join(url, 'registration', 'resume', uuid)
