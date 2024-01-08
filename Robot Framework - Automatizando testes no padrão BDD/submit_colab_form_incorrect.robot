*** Settings ***
Library           SeleniumLibrary
Resource          setup_teardown.robot
Test Setup        Given I access Organo
Test Teardown     Close's Browser

*** Variables ***
${BUTTON_SUBMIT_PERSON}    id:button-person

*** Test Cases ***
Verify if a obrigatory field isn't filled correctly the system will show a warning message
    Given I click on the submit button
    Then the system will show a warning message

*** Keywords ***
Given I click on the submit button
    Click Element    ${BUTTON_SUBMIT_PERSON}
Then the system will show a warning message
    Element Should Be Visible     class:error-message
    Element Text Should Be        class:error-message    Preencha todos os campos obrigatórios.
