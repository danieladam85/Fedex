Feature: Fedex Star Wars search engine

  I want to search for Star Wars characters and planets

  Scenario: Find a valid person
    Given I open the Star Wars search application
    When I click on the 'people' radio button
    And I type 'Luke Skywalker' in the searchfield
    And I click on the search button
    And the results column names should be:
    |rowName|
    |Gender|
    |Birth year|
    |Eye color|
    |Skin color|
    
    And the attributes for 'Luke Skywalker' should be:
    |rowName|rowValue|
    |Gender|male|
    |Birth year|19BBY|
    |Eye color|blue|
    |Skin color|fair|

  Scenario: Find an invalid person
    Given I open the Star Wars search application
    When I click on the 'people' radio button
    And I type 'Daniel Adam' in the searchfield
    And I click on the search button
    Then the results panel should display 'Not found'
  
  Scenario: Find a valid planet
    Given I open the Star Wars search application
    When I click on the 'planets' radio button
    And I type 'Alderaan' in the searchfield
    And I click on the search button
    Then the results should contain 'Alderaan'
    And the results column names should be:
    |rowName|
    |Population|
    |Climate|
    |Gravity|
    And the attributes for 'Alderaan' should be:
    |rowName|rowValue|
    |Population|2000000000|
    |Climate|temperate|
    |Gravity|1 standard|

  Scenario: Find an invalid planet
    Given I open the Star Wars search application
    When I click on the 'planets' radio button
    And I type 'Earth' in the searchfield
    And I click on the search button
    Then the results panel should display 'Not found'

  Scenario: Clear search results for people
    Given I open the Star Wars search application
    When I click on the 'people' radio button
    And I type 'Leia Organa' in the searchfield
    And I click on the search button
    And I clear the searchfield
    And I click on the search button
    Then the results panel should contain no results

  Scenario: Clear search results for planets
    Given I open the Star Wars search application
    When I click on the 'planets' radio button
    And I type 'Alderaan' in the searchfield
    And I click on the search button
    And I clear the searchfield
    And I click on the search button
    Then the results panel should contain no results

  Scenario: Find a person using the enter key
    Given I open the Star Wars search application
    When I click on the 'people' radio button
    And I type 'Leia Organa' in the searchfield
    And I type enter in the searchfield
    Then the results should contain 'Leia Organa'

  Scenario: Find a planet then a person
    Given I open the Star Wars search application
    When I click on the 'planets' radio button
    And I type 'Hoth' in the searchfield
    And I click on the search button
    Then the results should contain 'Hoth'
    When I click on the 'people' radio button
    And I click on the search button
    Then the results panel should display 'Not found'

  Scenario: Find more than one person
    Given I open the Star Wars search application
    When I click on the 'people' radio button
    And I type 'Darth' in the searchfield
    And I click on the search button
    Then the results should contain more than one result
    And the results column names should be:
    |rowName|
    |Gender|
    |Birth year|
    |Eye color|
    |Skin color|
    
  Scenario: Find more than one planet
    Given I open the Star Wars search application
    When I click on the 'planets' radio button
    And I type 'Al' in the searchfield
    And I click on the search button
    Then the results should contain more than one result
    And the results column names should be:
    |rowName|
    |Population|
    |Climate|
    |Gravity|