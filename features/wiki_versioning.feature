Feature: Versioning documents in our wiki
  As a contributor to the site
  I would like to keep past versions of documents easily accessible
  So that we can revert to or reference previous content

  Scenario: Referencing the first version
    Given a wiki document titled "FooBar" with body "Lorem ipsum..."
    When I visit the page "/wiki/FooBar/1"
    Then I should see "Lorem ipsum..."

  Scenario: Adding a new version
    Given a wiki document titled "FooBar" with body "Lorem ipsum..."
    When I change the document titled "FooBar" to have the body "Bort!"
    And I visit the page "/wiki/FooBar/2"
    Then I should see "Bort!"
    And I visit the page "/wiki/FooBar/1"
    Then I should see "Lorem ipsum..."
