from behave import then, use_step_matcher

from features.utils import get_resume_url

# use_step_matcher("re")


@then('I resume the process on a new tab')
def resume(self):
    import pyperclip
    url = get_resume_url(self)
    pyperclip.copy(url)

    self.driver.execute_script("window.open('', '_blank');")
    self.driver.switch_to.window(self.driver.window_handles[-1])
    # Open a different website in the new tab
    self.driver.get(url)


@then('I resume to "{url}"')
def resume(self, url):
    # Then I resume the process on a new tab
    #     Then the page path should be "/registration/payment/upload-check"
    self.execute_steps('Then I resume the process on a new tab')
    self.execute_steps(f'Then the page path should be "{url}"')
