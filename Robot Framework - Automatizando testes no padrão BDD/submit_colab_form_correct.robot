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
${INPUT_CREW_NAME}         id:crewName
${INPUT_CREW_COLOR}        id:color
${BUTTON_SUBMIT_CREW}      id:button-crew

@{OPTION_LIST}             
...                        //option[contains(.,'Programação')]
...                        //option[contains(.,'Front-End')]
...                        //option[contains(.,'Data Science')]
...                        //option[contains(.,'DevOps')] 
...                        //option[contains(.,'UX e Design')]
...                        //option[contains(.,'Mobile')]
...                        //option[contains(.,'Inovação e Gestão')]

@{OPTION_LIST_NAME}
...                        Programação
...                        Front-End
...                        Data Science
...                        DevOps
...                        UX e Design
...                        Mobile
...                        Inovação e Gestão

@{CREW_MEMBER_LIST}        
...                        Leonardo    
...                        Michelangelo    
...                        Rafael
@{CREW_MEMBER_IMAGE_LIST}  
...                        https://64.media.tumblr.com/fe23cfffcb7ab506ed3ba27fcc8d7fd0/f52f98e03b604f57-ef/s540x810/8710cd59c9f000a395cc5388d6a651f34166dbd8.jpg    
...                        https://64.media.tumblr.com/2fdfd70d692c164a2388928c0be707b3/242de0e4803c8658-0f/s540x810/06c1e6150436f47c8df34398de627328c3aaa284.png    
...                        https://i.pinimg.com/originals/f0/f1/f9/f0f1f928cb37a9b824c90086d33aeca1.png


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

*** Keywords ***
Given I fill the crew-member form
    Input Text        ${INPUT_NAME}      Donatello
    Input Text        ${INPUT_CHARGE}    Teenage Mutant Ninja Turtle
    Input Text        ${INPUT_IMAGE}     https://64.media.tumblr.com/c53ead840504a44e3aac38ed52927311/020a53632c19d596-5a/s400x600/25788f9f1942e7df5fdecdc9dfa309074f62b50b.png

Given I create three new crew-members and submit it
    FOR    ${INDEX}    IN RANGE    3
        ${CREW_MEMBER}=    Set Variable    ${CREW_MEMBER_LIST}[${INDEX}]
        Input Text        ${INPUT_NAME}      ${CREW_MEMBER}
        Input Text        ${INPUT_CHARGE}    Teenage Mutant Ninja Turtle
        ${IMAGE}=         Set Variable    ${CREW_MEMBER_IMAGE_LIST}[${INDEX}]
        Input Text        ${INPUT_IMAGE}     ${IMAGE}
        Click Element     ${INPUT_CREW}
        Click Element     ${OPTION_LIST}[1]
        Click Element     ${BUTTON_SUBMIT_PERSON}
        Element Should Be Visible    //h4[contains(.,'${CREW_MEMBER}')]
    END

And select Programação crew
    Click Element     ${INPUT_CREW}
    Click Element     ${OPTION_LIST}[1]

And I submit it
    Click Element     ${BUTTON_SUBMIT_PERSON}

Then I should see the crew-member in the Programação crew
    Element Should Be Visible    //h4[contains(.,'Donatello')]

Then identify three new cards in the expected crew
    FOR    ${CREW_MEMBER}    IN    @{CREW_MEMBER_LIST}
        Element Should Be Visible    //h4[contains(.,'${CREW_MEMBER}')]
    END

Then create and identify a new card in each crew
    FOR    ${INDEX}    ${CREW}    IN ENUMERATE    @{OPTION_LIST}
        Given I fill the crew-member form
        Click Element     ${CREW}
        And I submit it
        Element Should Be Visible    //h3[contains(.,'${OPTION_LIST_NAME}[${INDEX}]')]
    END