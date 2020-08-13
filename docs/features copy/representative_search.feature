Feature: search for representatives by location

  As a user 
  So that I can find representatives in my area
  I want to be able to search for representives by location

Background: representatives in database

  Given the following representatives exist:
  | name          | title          | party      | state     | 
  | Donald Trump  | President      | Republican | CA        |
  | Mike Pence    | Vice President | Republican | CA        |

Scenario: search by location
  When I go to the Representative page 
  And  I fill in "Enter a location" with "CA"
  And  I press "Search"
  Then I should see "Donald Trump" 

