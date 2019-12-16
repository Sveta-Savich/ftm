Description: Trello. Sign In

Scenario: Preconditions

Given I am on the main application page
When I remove all cookies from the current domain
When I click on element located `By.xpath(//a[@class="btn btn-sm btn-link text-white"])`
Then the page with the URL 'https://trello.com/login' is loaded
When I enter `<nameNew>` in field located `By.xpath(//input[@id='user'])`
When I enter `<password>` in field located `By.xpath(//input[@id='password'])`
When I click on element located `By.xpath(//input[@id='login'])`
Examples:
|nameNew               |password  |
|Svetatest@ugly.email  |Testing123|

Scenario: Profile verification

When I click on element located `By.xpath(//button[@data-test-id="header-member-menu-button"])`
When I click on all elements located `By.xpath(//a[@data-test-id="header-member-menu-profile"])`
Then the element with the xpath '//a[@data-tab="profile"]' exists for '5' seconds

Scenario: Pages verification

!-- For first run I've used ESTABLISH commands (steps are commented) instead of COMPARE_AGAINST commands (steps are uncommented now).
!-- For second run I've used steps as they are displayed now (ESTABLISH commands are commented))

Given I am on a page with the URL 'https://trello.com/sveta684'
!-- When I ESTABLISH baseline with `profilePage`
When I COMPARE_AGAINST baseline with `profilePage`
When I click on element located `By.xpath(//a[@class="tabbed-pane-nav-item-button js-member-activity"])`
!-- When I ESTABLISH baseline with `activityPage`
When I COMPARE_AGAINST baseline with `activityPage`
When I click on element located `By.xpath(//a[@class="tabbed-pane-nav-item-button js-member-cards"])`
!-- When I ESTABLISH baseline with `cardsPage`
When I COMPARE_AGAINST baseline with `cardsPage`
When I click on element located `By.xpath(//a[@data-tab="settings"])`
!-- When I ESTABLISH baseline with `settingsPage`
When I COMPARE_AGAINST baseline with `settingsPage`
When I click on element located `By.xpath(//a[@data-tab="trello-gold"])`
!-- When I ESTABLISH baseline with `TrelloGoldPage`
When I COMPARE_AGAINST baseline with `TrelloGoldPage`
When I remove all cookies from the current domain


















