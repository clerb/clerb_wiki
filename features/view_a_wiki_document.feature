Feature: View a Wiki Document
  In order to find useful information
  As a site visitor
  I want to see wiki documents

  Scenario: Viewing an Existing Document
    Given a wiki document titled "MyDocument" with body "Lorem ipsum..."
    When I go to the wiki page for "MyDocument"
    Then I should see "MyDocument"
      And I should see "Lorem ipsum..."
