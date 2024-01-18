from urllib.parse import urlparse
from behave import then


@then('the page path should be "{expected_path}"')
def check_path(context, expected_path):
    current_url = context.driver.current_url
    parsed_url = urlparse(current_url)
    actual_path = parsed_url.path
    assert actual_path == expected_path, f'Expected title: {expected_path}, Actual title: {actual_path}'
