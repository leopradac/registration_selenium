from selenium.webdriver.common.by import By


def scroll_and_click(context, css_selector):
    element = context.driver.find_element(By.CSS_SELECTOR, css_selector)
    context.driver.execute_script("arguments[0].scrollIntoView();", element)
    element.click()
    return element


def scroll_and_type(context, css_selector, text):
    element = context.driver.find_element(By.CSS_SELECTOR, css_selector)
    context.driver.execute_script("arguments[0].scrollIntoView();", element)
    element.send_keys(text)
    return element
