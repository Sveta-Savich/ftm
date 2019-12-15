Description: Trello. Task 1

Scenario: Sign up

!-- Given I am on the main application page
Given I am on a page with the URL 'https://trello.com'
When I enter `<nameNew>` in field located `By.xpath(//input[@name='email'])`
When I add `@ugly.email` to field located `By.xpath(//input[@name='email'])`
When I click on element located `By.xpath(//button[@type='submit'])`
When I wait until element located `By.xpath(//input[@id='password'])` appears
When I enter `<newName>` in field located `By.xpath(//input[@id="name"])`
When I enter `#{generate(regexify '[1-9]{7}[a-z]{2}` in field located `By.xpath(//input[@id='password'])`
When I click on element located `By.xpath(//button[@id='signup-submit'])`
When I wait until element located `By.xpath(//div[@class='first-board-wrapper'])` appears
Then the element with the xpath '//input[@data-test-id="board-name-input"]' exists for '5' seconds
Examples:
|nameNew                      |
|#{generate(Name.firstName)}  |
|#{generate(Name.firstName)}  |








