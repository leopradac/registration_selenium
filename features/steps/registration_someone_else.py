import time

from behave import then, given
from selenium.common import NoSuchElementException
from selenium.webdriver.common.by import By


from features.utils import scroll_and_click, scroll_and_type


# only someone-else
@given('this set of data I will create a registration entity for each')
def set_someone_else_dataset(context):
    context.someone_else_dataset = context.table


# only someone-else
@then('at performer-list I add the performer(s) name(s)')
def performer_list(self):
    table = self.someone_else_dataset
    form = self.driver.find_elements(By.CSS_SELECTOR, ".v-form input")
    assert len(form) == 3, f'performer-list view was expected to have 3 inputs and got {len(form)}'
    for artist in table:
        form[0].send_keys(artist['fname'])
        form[1].send_keys(artist['mname'])
        form[2].send_keys(artist['lname'])
        scroll_and_click(self, '.v-btn--variant-outlined')
        time.sleep(1)
    scroll_and_click(self, '.form-nav-btn')


@then('I start iterating through the respective forms for a {who_type}')
def step_impl(context, who_type):
    """who_type: performer | both | rights-owner"""
    table = context.someone_else_dataset
    for index, artis in enumerate(table):
        context.someone_else_index = index
        context.execute_steps('Then at registration/ID/contact I fill the form')
        context.execute_steps('Then I upload the photo ID from /Users/Shared/sx/upload.png')
        context.execute_steps('Then I upload the Auth form from /Users/Shared/sx/upload.png')
        context.execute_steps('Then I add the artist names for someone-else')
        context.execute_steps('Then I add the band names for someone-else')
        context.someone_else_index += 1


# only someone-else
@then('at registration/ID/contact I fill the form')
def someone_else_contact(self):
    table = self.someone_else_dataset
    index = self.someone_else_index
    data = table[index]
    scroll_and_type(self, '#emailAddress', data['mail'])
    scroll_and_type(self, '#confirmEmailAddress', data['mail_c'])
    scroll_and_type(self, '#dateOfBirth', data['date'])
    scroll_and_type(self, '#gender', data['gender'])
    scroll_and_type(self, '#countryOfResidence', data['residence'])
    time.sleep(2)
    try:
        zip_c = self.driver.find_element(By.CSS_SELECTOR, '#zip')
        time.sleep(2)
        if zip_c:
            zip_c.send_keys(data['zip'])
            scroll_and_type(self, '#state', data['state'])
    except NoSuchElementException as e:
        pass
    scroll_and_type(self, '#countryOfBirth', data['birth'])
    scroll_and_click(self, '.form-nav-btn')


# only someone-else
@then('I add the artist names for someone-else')
def someone_else_artist_names(self):
    table = self.someone_else_dataset
    index = self.someone_else_index
    data = table[index]
    artist_names = data.get('artist', '').split(',')
    for artist in artist_names:
        self.driver.find_element(By.ID, "solo-name").send_keys(artist)
        self.driver.find_element(By.CSS_SELECTOR, ".v-btn__content:nth-child(4)").click()
        time.sleep(1)
    self.driver.find_element(By.CSS_SELECTOR, ".v-btn--variant-outlined").click()


@then('I add the band names for someone-else')
def band_names(self):
    table = self.someone_else_dataset
    index = self.someone_else_index
    data = table[index]
    bands = data.get('bands', '').split(',')
    if bands:
        for band in bands:
            self.driver.find_element(By.ID, "band-name").send_keys(band)
            self.driver.find_element(By.CSS_SELECTOR, ".v-btn__content:nth-child(4)").click()
            time.sleep(1)
    scroll_and_click(self, '.v-btn--variant-outlined')
