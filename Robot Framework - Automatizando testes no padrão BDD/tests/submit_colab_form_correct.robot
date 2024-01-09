*** Settings ***
Resource          ../resources/main.robot
Test Setup        Given I access Organo
Test Teardown     Close's Browser

*** Test Cases ***
Verify if when I fill the crew-member form and submit it, I can see the crew-member in the Programação crew
    Given I fill the crew-member form
    And select Programação crew
    And I submit it
    Then I should see the crew-member in the Programação crew

Verify if is possible to create a new crew member if we fill the form correctly
    Given I create three new crew-members and submit it
    Then identify three new cards in the expected crew

Verify if is possible to create a card for each crew if we fill the form correctly
    Given I fill the crew-member form
    Then create and identify a new card in each crew

