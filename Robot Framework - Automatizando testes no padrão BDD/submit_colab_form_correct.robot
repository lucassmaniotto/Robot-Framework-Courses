*** Settings ***
Library           SeleniumLibrary
Resource          setup_teardown.robot
Test Setup        Given I access Organo
Test Teardown     Close's Browser

*** Variables ***
${INPUT_NAME}              id:name
${INPUT_CHARGE}            id:charge
${INPUT_IMAGE}             id:image
${INPUT_CREW}              id:crew
${BUTTON_SUBMIT_PERSON}    id:button-person
${OPTION_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPTION_FRONT}            //option[contains(.,'Front-End')]
${OPTION_DADOS}            //option[contains(.,'Data Science')]
${OPTION_DEVOPS}           //option[contains(.,'Devops')] 
${OPTION_UX}               //option[contains(.,'UX e Design')]
${OPTION_MOBILE}           //option[contains(.,'Mobile')]
${OPTION_INOVACAO}         //option[contains(.,'Inovação e Gestão')]
${INPUT_CREW_NAME}         id:crewName
${INPUT_CREW_COLOR}        id:color
${BUTTON_SUBMIT_CREW}      id:button-crew

*** Test Cases ***
Verify if when I fill the crew-member form and submit it, I can see the crew-member in the Programação crew
    Given I fill the crew-member form
    And I submit it
    Then I should see the crew-member in the Programação crew

*** Keywords ***
Given I fill the crew-member form
    Input Text        ${INPUT_NAME}      Donatello
    Input Text        ${INPUT_CHARGE}    Teenage Mutant Ninja Turtle
    Input Text        ${INPUT_IMAGE}     https://64.media.tumblr.com/c53ead840504a44e3aac38ed52927311/020a53632c19d596-5a/s400x600/25788f9f1942e7df5fdecdc9dfa309074f62b50b.png
    Click Element     ${INPUT_CREW}
    Click Element     ${OPTION_PROGRAMACAO}

And I submit it
    Click Element     ${BUTTON_SUBMIT_PERSON}

Then I should see the crew-member in the Programação crew
    Element Should Be Visible    //h4[contains(.,'Donatello')]