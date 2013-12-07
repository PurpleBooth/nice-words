Feature: Nice messages are displayed
  In order to feel good
  As a person who doesn't feel good
  I want to be shown nice messages

  Scenario: A different message is shown each time the pages is loaded
    Given I have the following nice messages to display:
      | Message              |
      | You look great today |
      | You're a nice person |
      | e-hug!               |
    When I display a nice message
    Then I should see a nice message
    When I display a nice message
    Then I should see another nice message
    When I display a nice message
    Then I should see another nice message