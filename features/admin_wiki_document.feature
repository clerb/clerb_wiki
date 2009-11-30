Feature: Managing documents in our wiki
  As a contributor to the site
  I would like to add and edit documents 
  So that others may benefit from my wit and wisdom
  
  Scenario: Create a document
    Given I am a logged in administrator
    When I create a document
    Then document is published on the homepage
    
  Scenario: Update a document
    Given I am a logged in administrator
    And a document that I have authored in the past exists
    When I edit the document
    Then the latest version is published on the homepage