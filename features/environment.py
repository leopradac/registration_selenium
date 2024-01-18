import time
import os
from selenium import webdriver


def before_all(context):
    debug_on = os.environ.get('DEBUG_ON', False)
    options = webdriver.ChromeOptions()

    if debug_on == 'true':

        # provide location where chrome stores profiles
        options.add_argument(r"--user-data-dir=/Users/leoprada/Library/Application Support/Google/Chrome/")

        # provide the profile name with which we want to open browser
        options.add_argument(r'--profile-directory=Profile 2')
        options.add_argument('--remote-debugging-port=9222')
        # options.binary_location = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

    # specify where your chrome driver present in your pc
    context.driver = webdriver.Chrome(options=options)
    context.driver.maximize_window()

    # Initialize WebDriver
    # context.driver = webdriver.Chrome()
    context.driver.implicitly_wait(5)


def after_all(context):
    # Cleanup
    input("Press Enter to close the browser")
    if context.driver:
        context.driver.quit()


def after_step(context, _):
    time.sleep(1)
