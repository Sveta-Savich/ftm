Description: Trello. Task 1

Scenario: Sign up

Given I am on the main application page
When I remove all cookies from the current domain
Then the page with the URL 'https://trello.com/' is loaded
When I click on element located `By.xpath(//a[@data-analytics-event="clickedSignupHeaderButton"])`
When I wait until element located `By.xpath(//input[@id='email'])` appears
When I enter `<nameNew>` in field located `By.xpath(//input[@id='email'])`
When I add `@ugly.email` to field located `By.xpath(//input[@id='email'])`
When I click on element located `By.xpath(//input[@id='signup'])`
When I wait until element located `By.xpath(//input[@id='name'])` appears
When I enter `<nameNew>` in field located `By.xpath(//input[@id='name'])`
When I enter `<password>` in field located `By.xpath(//input[@id='password'])`
When I click on element located `By.xpath(//input[@id='signup'])`
Examples:
|nameNew                      |password                             |
|#{generate(Name.firstName)}  |#{generate(regexify '[1-5]{4}[a-z]{5}|

Scenario: API 
!-- key finding
Given I am on a page with the URL 'https://trello.com/app-key'
When I change context to an element by the xpath '//*[contains(@class,'center')]'
When I click on an element with the text 'I acknowledge that I have read and accept'
When I click on element located `By.xpath(//button[@class='button button-green js-generate-api-key'])`
When I change context to an element by the xpath '//*[@id='key']'
When I set 'value' attribute value of the context element to the 'STORY' variable 'api_Key'
!-- token search 
When I change context to an element by the xpath '//*[contains(@class,'center')]'
When I click on element located `By.xpath(//a[@data-track-direct-object="generate token link"])`
When I switch to a new window
When I wait until element located `By.xpath(//input[@id="approveButton"])` appears
When I click on element located `By.xpath(//input[@id="approveButton"])`
When I change context to an element by the xpath '//*[@class='content']/pre'
When I set the text found in search context to the 'STORY' variable 'api_Token'

Scenario: Board creating
Given request body: <requestBody>
When I set request headers:
|name  |value           |
|key   |'${api_Key}'    |
|token |'${api_Token}'  |
When I issue a HTTP POST request for a resource with the URL 'https://api.trello.com/1/boards/<board_name><API><Token>'
Then the response code is equal to '200'
Then the response body contains '"id":'
Then the response body contains '"name":'
Then the response body contains '"shortUrl":'
Then the response body contains '"url":'
Examples:
|board_name       |API            |Token              |
|?name=Sveta_Board|&key=${api_Key}|&token=${api_Token}|








