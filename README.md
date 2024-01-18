#Notes
## instructions
To be able to work with profiles it requires to run a couple of previous steps.

- Chrome must be entirely closed (hold command+Q)
- run: `/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222`
- add:
  ```
  options = webdriver.ChromeOptions()
  options.add_argument('--remote-debugging-port=9222')
  context.driver = webdriver.Chrome(options=options)
  ```
  
## Steps definition + "typing"
`use_step_matcher("re")` allows to define steps and define the possible values for the variables in each.
For instance, let's say we define a step like this:
```python
from behave import then, use_step_matcher
use_step_matcher("re")
@then('At main page I select "(?P<who>myself|someone-else)"')
def step_impl(context, to_who):
    # step logic
    pass
```
Now, when calling the step at the `*.feature` file if using a code editor (as pycharm) it will have as suggestions these
two options:
- `Then At main page I select myself`
- `Then At main page I select someone-else`
If setting anything different will lint error, as `Then At main page I select other`

## Iterating steps
Since there are scenarios where we have a small set of steps to be iterated with determined dataset we are using
`context.execute_steps()` wrapped in a for loop. https://behave.readthedocs.io/en/stable/api.html#from-behave-import.
Note that Scenario Outline doesn't work for this purpose since the latter executes a complete scenario for each row
defined. Different to the mentioned case where I want just a few steps from the scenario.