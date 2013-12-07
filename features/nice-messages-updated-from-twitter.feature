Feature: Nice messages are updated from twitter
  In order to feel like the compliments are always fresh
  As a person who doesn't feel good
  I want to be shown compliments pulled from twitter

  Scenario: If there are no messages stored. Go get some from twitter
    Given I have no messages to display
    And twitter has some nice messages
    When I display a nice message
    Then my nice message store should be filled with nice messages

  Scenario: Only display the nice ones. No mean ones.
    Given I have no messages to display
    And twitter has a combination of nice and mean messages
    When I display a nice message
    Then my nice message store should be filled with nice messages