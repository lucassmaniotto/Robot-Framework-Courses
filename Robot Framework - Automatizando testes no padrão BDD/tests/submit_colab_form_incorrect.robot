*** Settings ***
Resource          ../resources/main.robot
Test Setup        Given I access Organo
Test Teardown     Close's Browser

*** Test Cases ***
Verify if a obrigatory field isn't filled correctly the system will show a warning message
    Given I click on the submit button
    Then the system will show a warning message

