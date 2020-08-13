Feature: representative profile

  As a user 
  So that I can find out more information about a particular representative
  I want to be able to view a representative profile

Background: representatives in database

  Given the following representatives exist:
  | name          | title          | party      | state     | 
  | Donald Trump  | President      | Republican | CA        |
  | Mike Pence    | Vice President | Republican | CA        |

Scenario: view profile from search results page
  When I go to the Representative page 
  And  I fill in "Enter a location" with "CA"
  And  I press "Search"
  Then I should see "Donald Trump" 

Scenario: profile contains information about Representative
  When I go to the Representative page 
  And  I fill in "Enter a location" with "CA"
  And  I press "Search"
  And  I press "Profile"
  Then I should see "Donald Trump"
  And  I should see "Republican" 