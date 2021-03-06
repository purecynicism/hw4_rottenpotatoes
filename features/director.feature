Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
  And  I am on the RottenPotatoes home page

Scenario: add director to existing movie
  When I move to the edit page for "Alien"
  And  I put in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Ridley Scott"

Scenario: find movie with same director
  Given I am on the RottenPotatoes home page
  Then I move to the details page for "Star Wars"
  When  I click the link "Find Movies With Same Director"
  Then  I am at the Similar Movies page for "Star Wars"
  And   I should see the movie "THX-1138"
  But   I should not see the movie "Blade Runner"

Scenario: can't find similar movies if we don't know director (sad path)
   Given I am on the RottenPotatoes home page
  Then I move to the details page for "Alien"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
