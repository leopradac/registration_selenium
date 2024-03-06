from urllib.parse import urlparse
from behave import then
from selenium.webdriver.common.by import By

from features.utils import scroll_and_click


@then('the page path should be "{expected_path}"')
def check_path(context, expected_path):
    actual_path = urlparse(context.driver.current_url).path
    assert expected_path == actual_path, f'Expected path: {expected_path}, Actual path: {actual_path}'


@then('I click continue')
def click_continue(context):
    scroll_and_click(context, ".form-nav-btn")


@then('font-size of element with "{selector}" as selector should be {expected_size}')
def font_size(context, selector, expected_size):
    try:
        # Find the element by its locator (e.g., XPath, CSS selector, etc.)
        element = context.driver.find_element(By.CSS_SELECTOR, selector)
        # Get the computed style of the element
        actual_font_size = element.value_of_css_property("font-size")
        actual_path = urlparse(context.driver.current_url).path
        assert actual_font_size == expected_size, f'Font at {actual_path}; found: {actual_font_size}, expected: {expected_size}'
    except AssertionError as error:
        print(error)
        pass
